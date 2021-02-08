import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:micatalogs/controllers/base_controller.dart';
import 'package:micatalogs/elements/app_functions.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/helpers/helper.dart';
import 'package:micatalogs/models/country_state_city_model.dart';
import 'package:micatalogs/models/currency_model.dart';
import 'package:micatalogs/repository/auth_repo.dart';
import 'package:micatalogs/repository/business_details_repo.dart';

class AddEditBusinessDetailsController extends BaseController {
  bool isLoading = false;
  bool isAddDetail = false;
  File fileLogo;
  String businessName = "";
  String businessNameError = "";
  String email = "";
  String emailError = "";
  String tagLine = "";
  String urlLogo;
  String phoneNumber = "";
  String address = "";
  String addressError = "";
  String pinCode = "";
  String pinCodeError = "";
  String domainName = "";
  String domainNameError = "";
  CountryModel country;
  String countryError = "";
  StateModel staTe;
  String stateError = "";
  CityModel city;
  String cityError = "";
  CurrencyModel currency;
  String currencyError = "";
  Map language;
  String languageError = "";
  List<CountryModel> countryList = [];
  List<StateModel> stateList = [];
  List<CityModel> cityList = [];
  List<CurrencyModel> currencyList = [];
  List<Map> languageList = [
    {"code": 'en', "title": 'English'},
    {"code": 'hi', "title": 'हिन्दी'},
    {"code": 'gj', "title": 'ગુજરાતી'},
    {"code": 'fr', "title": 'French'},
    {"code": 'es', "title": 'Española'},
    {"code": 'id', "title": 'Bahana indonesia'},
  ];

  bool validateDetails(context) {
    if (businessName.isNotEmpty &&
        email.isNotEmpty &&
        Helper.isEmail(email.trim()) &&
        address.isNotEmpty &&
        pinCode.isNotEmpty &&
        (countryList.isNotEmpty && country != null ||
            countryList.isEmpty && country == null) &&
        (stateList.isNotEmpty && staTe != null ||
            stateList.isEmpty && staTe == null) &&
        (cityList.isNotEmpty && city != null ||
            cityList.isEmpty && city == null) &&
        (currencyList.isNotEmpty && currency != null ||
            cityList.isEmpty && city == null) &&
        language != null &&
        domainName.isNotEmpty) {
      return true;
    } else {
      if (businessName.isEmpty) {
        setState(() => businessNameError = 'Enter valid business name');
      }
      if (email.isEmpty || !Helper.isEmail(email.trim())) {
        setState(() => emailError = 'Enter valid email');
      }
      if (currency == null) {
        toast('Select valid currency');
      }
      if (address.isEmpty) {
        setState(() => addressError = 'Enter valid address');
      }
      if (pinCode.isEmpty) {
        setState(() => pinCodeError = 'Enter valid pinCode');
      }
      if (country == null) {
        setState(() => countryError = 'Select valid country');
      }
      if (stateList.isNotEmpty && staTe == null) {
        toast('Select valid state');
      }
      if (cityList.isNotEmpty && city == null) {
        toast("Select valid city");
      }
      if (language == null) {
        setState(() => languageError = 'Select valid languageError');
      }
      if (domainName.isEmpty) {
        setState(() => domainNameError = 'Enter valid domain name');
      }
      return false;
    }
  }

  void onSavedBusinessDetails(context) {
    Navigator.pop(context, true);
  }

  void setBusinessDetails(context) async {
    setState(() => isLoading = true);
    Response res = await BusinessDetailsRepo.getStoreDetailsApi();
    if (res.statusCode == 200) {
    } else if (res.statusCode == 401) {
      AppClass.unAuthenticatedUser(context, res);
    } else if (res.statusCode == 404) {
      getCountryList(context);
      getCurrencyList(context);
      setState(() {
        isLoading = false;
        isAddDetail = true;
      });
    } else if (res.statusCode == 503) {
      AppClass.internetNotConnection(res);
    }
  }

  void onSaveBusinessDetail(context) {
    setState(() {
      isLoading = true;
    });
    if(isAddDetail) {
      try {
        
      } catch (e) {
      }
    } else {
      try {
        
      } catch (e) {
      }
    }
  }

  

  void getCurrencyList(context) async {
    Response res = await BusinessDetailsRepo.getCurrencyApi();
    if (res.statusCode == 200) {
      var decoded = json.decode(res.body);
      if (decoded['data']['currency'] != []) {
        decoded['data']['currency'].forEach((data) {
          CurrencyModel currencyItem = CurrencyModel(
            id: data['_id'],
            country: data['country'],
            currency: data['currency'],
            code: data['code'],
            symbol: data['symbol'],
          );
          setState(() => currencyList.add(currencyItem));
        });
      }
    } else if (res.statusCode == 401) {
      AppClass.unAuthenticatedUser(context, res);
    } else if (res.statusCode == 503) {
      AppClass.internetNotConnection(res);
    } else {
      toast("Currency not available");
    }
  }

  void getCountryList(context) async {
    Response res = await AuthRepo.getCountryApi();
    if (res.statusCode == 200) {
      var decoded = json.decode(res.body);
      if (decoded['data']['country'] != []) {
        decoded['data']['country'].forEach((data) {
          CountryModel countryItem = CountryModel(
            id: data['_id'],
            name: data['name'],
            phoneCode: data['phonecode'].toString(),
            shortName: data['sortname'],
          );
          setState(() => countryList.add(countryItem));
        });
      }
    } else if (res.statusCode == 503) {
      AppClass.internetNotConnection(res);
    } else {
      toast("Countries not available");
    }
  }

  void getStateList(context, countryID) async {
    setState(() {
      stateList = [];
      staTe = null;
      cityList = [];
      city = null;
    });
    Response res = await BusinessDetailsRepo.getStateApi(countryId: countryID);
    if (res.statusCode == 200) {
      var decoded = json.decode(res.body);
      if (decoded['data']['state'] != []) {
        decoded['data']['state'].forEach((data) {
          StateModel stateItem = StateModel(
            id: data['_id'],
            name: data['name'],
          );
          setState(() => stateList.add(stateItem));
        });
      }
    } else if (res.statusCode == 401) {
      AppClass.unAuthenticatedUser(context, res);
    } else if (res.statusCode == 503) {
      AppClass.internetNotConnection(res);
    } else {
      toast("States not available");
    }
  }

  void getCityList(context, stateID) async {
    setState(() {
      cityList = [];
      city = null;
    });
    Response res = await BusinessDetailsRepo.getCityApi(stateId: stateID);
    if (res.statusCode == 200) {
      var decoded = json.decode(res.body);
      if (decoded['data']['city'] != []) {
        decoded['data']['city'].forEach((data) {
          CityModel cityItem = CityModel(
            id: data['_id'],
            name: data['name'],
          );
          setState(() => cityList.add(cityItem));
        });
      }
    } else if (res.statusCode == 401) {
      AppClass.unAuthenticatedUser(context, res);
    } else if (res.statusCode == 503) {
      AppClass.internetNotConnection(res);
    } else {
      toast("Cities not available");
    }
  }
}
