import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:micatalogs/elements/app_functions.dart';
import 'package:micatalogs/elements/loading_overlay.dart';
import 'package:micatalogs/helpers/helper.dart';
import 'package:micatalogs/models/country_state_city_model.dart';
import 'package:micatalogs/repository/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../helpers/global.dart';
import '../../helpers/variable_keys.dart';
import '../base_controller.dart';

class RegisterScreenController extends BaseController {
  String email = '';
  String emailError = '';
  String fullName = '';
  String fullNameError = '';
  String phoneNo = '';
  String phoneNoError = '';
  String countryError = '';
  String password = '';
  String passwordError = '';
  List<CountryModel> countryList = [];
  CountryModel country;
  bool isLoading = false;

  void invalidFullName() {
    setState(() => fullNameError = 'Enter valid Name');
  }

  void validFullName() {
    setState(() => fullNameError = '');
  }

  void invalidPhoneNo() {
    setState(() => phoneNoError = 'Enter valid Phone No');
  }

  void validPhoneNo() {
    setState(() => phoneNoError = '');
  }

  void invalidEmail() {
    setState(() => emailError = 'Enter valid email');
  }

  void validEmail() {
    setState(() => emailError = '');
  }

  void invalidCountry() {
    setState(() => countryError = 'Select valid country');
  }

  void validCountry() {
    setState(() => countryError = '');
  }

  void invalidPassword() {
    setState(() => passwordError = 'Enter valid password');
  }

  void validPassword() {
    setState(() => passwordError = '');
  }

  void getCountryListApi(context) async {
    Response res = await AuthRepo.getCountryApi();
    if (res.statusCode == 200) {
      var decoded = json.decode(res.body);
      log(decoded.toString());
      if (decoded['data']['country'] != []) {
        decoded['data']['country'].forEach((d) {
          print(d);
          CountryModel countryItem = CountryModel(
            id: d['_id'],
            name: d['name'],
            phoneCode: d['phonecode'].toString(),
            shortName: d['sortname'],
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

  bool validateInput() {
    if (email.isNotEmpty &&
        Helper.isEmail(email) &&
        password.isNotEmpty &&
        fullName.isNotEmpty &&
        country != null &&
        phoneNo.isNotEmpty) {
      return true;
    } else {
      if (fullName.isEmpty) {
        invalidFullName();
      }
      if (phoneNo.isEmpty) {
        invalidPhoneNo();
      }
      if (email.isEmpty || !Helper.isEmail(email)) {
        invalidEmail();
      }
      if (password.isEmpty) {
        invalidPassword();
      }
      if (country == null) {
        invalidCountry();
      }
      return false;
    }
  }

  registerButtonPressed(context) {
    final overlay = LoadingOverlay.of(context);
    overlay.show();
    proceed(context).then((isSucceed) {
      overlay.hide();
      if (isSucceed ?? false) {
        Navigator.pushNamed(context, RouteKeys.STORE_SETUP);
      }
    });
  }

  Future proceed(context) async {
    try {
      Response response = await AuthRepo.registerUser(
        email: email,
        password: password,
        country: country.name,
        fullName: fullName,
        phoneNo: phoneNo,
      );
      if (response.statusCode == 200) {
        var decoded = json.decode(response.body);
        log(decoded.toString());
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(
          PrefsKey.USER_ID,
          decoded['data']['new_user']['_id'],
        );
        prefs.setString(
          PrefsKey.ACCESS_TOKEN,
          decoded['data']['token'],
        );
        return true;
      } else if (response.statusCode == 422) {
        var decoded = jsonDecode(response.body);
        toast(decoded['errors'][0]['msg']);
      } else if (response.statusCode == 503) {
        AppClass.internetNotConnection(response);
      }
    } catch (e) {
      print('final catch');
      print(e);
    }
  }
}
