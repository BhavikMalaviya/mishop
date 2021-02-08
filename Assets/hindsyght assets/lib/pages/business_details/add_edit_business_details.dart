import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:micatalogs/elements/app_loader.dart';
import 'package:micatalogs/models/country_state_city_model.dart';
import 'package:micatalogs/models/currency_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:micatalogs/controllers/business_details/add_edit_business_controller.dart';

class AddEditBusinessDetailsScreen extends StatefulWidget {
  @override
  _AddEditBusinessDetailsScreenState createState() =>
      _AddEditBusinessDetailsScreenState();
}

class _AddEditBusinessDetailsScreenState
    extends StateMVC<AddEditBusinessDetailsScreen> {
  AddEditBusinessDetailsController _con;
  _AddEditBusinessDetailsScreenState()
      : super(AddEditBusinessDetailsController()) {
    _con = controller;
  }

  @override
  void initState() {
    _con.setBusinessDetails(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appColor,
        iconTheme: IconThemeData(color: AppColors.whiteTextColor),
        title: Text(
          'Add Your Business Details',
          style: TextStyle(
            color: AppColors.whiteTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: _con.isLoading
          ? Center(child: AppLoader())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 100,
                    height: 20,
                  ),
                  Container(
                    height: SizeConfig.safeBlockVertical * 15,
                    width: SizeConfig.safeBlockVertical * 15,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.appColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.extraLightAppColor,
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/svg/camera.svg"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Add Logo",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  inputField(
                    icon: "assets/svg/businessName.svg",
                    title: "Business Name",
                    child: TextFormField(
                      initialValue: _con.businessName,
                      cursorColor: AppColors.appColor,
                      onChanged: (val) => setState(() {
                        _con.businessName = val;
                        _con.businessNameError = '';
                      }),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                    errorText: _con.businessNameError,
                  ),
                  inputField(
                    icon: "assets/svg/message.svg",
                    title: "Email Id",
                    child: TextFormField(
                      initialValue: _con.email,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: AppColors.appColor,
                      onChanged: (val) => setState(() {
                        _con.email = val;
                        _con.emailError = '';
                      }),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                    errorText: _con.emailError,
                  ),
                  inputField(
                    icon: "assets/svg/tag.svg",
                    title: "Tag Line",
                    child: TextFormField(
                      initialValue: _con.tagLine,
                      cursorColor: AppColors.appColor,
                      onChanged: (val) => setState(() => _con.tagLine = val),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                    errorText: "",
                  ),
                  doubleInputField(
                    title1: "Currency",
                    icon1: "assets/svg/currency.svg",
                    child1: DropdownButton(
                      value: _con.currency,
                      underline: SizedBox(),
                      hint: Text(
                        'Currency',
                        overflow: TextOverflow.ellipsis,
                      ),
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                      ),
                      items: _con.currencyList.map((val) {
                        return DropdownMenuItem<CurrencyModel>(
                          value: val,
                          child: Text(
                            "${val.country} (${val.symbol})",
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      onChanged: (CurrencyModel value) {
                        setState(() => _con.currency = value);
                      },
                    ),
                    title2: "Phone Number",
                    icon2: "assets/svg/phoneNo.svg",
                    child2: TextFormField(
                      initialValue: _con.phoneNumber,
                      cursorColor: AppColors.appColor,
                      keyboardType: TextInputType.number,
                      onChanged: (val) =>
                          setState(() => _con.phoneNumber = val),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  inputField(
                    icon: "assets/svg/address.svg",
                    title: "Address",
                    child: TextFormField(
                      initialValue: _con.address,
                      cursorColor: AppColors.appColor,
                      onChanged: (val) => setState(() {
                        _con.address = val;
                        _con.addressError = '';
                      }),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                    errorText: _con.addressError,
                  ),
                  inputField(
                    icon: "assets/svg/address.svg",
                    title: "Zipcode/Pincode",
                    child: TextFormField(
                      initialValue: _con.pinCode,
                      keyboardType: TextInputType.number,
                      cursorColor: AppColors.appColor,
                      onChanged: (val) => setState(() {
                        _con.pinCode = val;
                        _con.pinCodeError = '';
                      }),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                    errorText: _con.pinCodeError,
                  ),
                  inputField(
                    icon: "assets/svg/earth.svg",
                    title: "Country",
                    child: DropdownButton(
                      value: _con.country,
                      underline: SizedBox(),
                      hint: Text('Select Country'),
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                      ),
                      items: _con.countryList.map((val) {
                        return DropdownMenuItem<CountryModel>(
                          value: val,
                          child: Text(val.name),
                        );
                      }).toList(),
                      onChanged: (CountryModel value) {
                        setState(() {
                          _con.country = value;
                          _con.countryError = '';
                        });
                        _con.getStateList(context, value.id);
                      },
                    ),
                    errorText: _con.countryError,
                  ),
                  doubleInputField(
                    title1: "State",
                    icon1: "assets/svg/state.svg",
                    child1: DropdownButton(
                      value: _con.staTe,
                      underline: SizedBox(),
                      hint: Text('Select State'),
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                      ),
                      items: _con.stateList.map((val) {
                        return DropdownMenuItem<StateModel>(
                          value: val,
                          child: Text(val.name),
                        );
                      }).toList(),
                      onChanged: (StateModel value) {
                        setState(() => _con.staTe = value);
                        _con.getCityList(context, value.id);
                      },
                    ),
                    title2: "City",
                    icon2: "assets/svg/apartment.svg",
                    child2: DropdownButton(
                      value: _con.city,
                      underline: SizedBox(),
                      hint: Text('Select City'),
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                      ),
                      items: _con.cityList.map((val) {
                        return DropdownMenuItem<CityModel>(
                          value: val,
                          child: Text(val.name),
                        );
                      }).toList(),
                      onChanged: (CityModel value) {
                        setState(() => _con.city = value);
                      },
                    ),
                  ),
                  inputField(
                    icon: "assets/svg/lang.svg",
                    title: "Default language",
                    child: DropdownButton(
                      value: _con.language,
                      underline: SizedBox(),
                      hint: Text('Select Language'),
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                      ),
                      items: _con.languageList.map((val) {
                        return DropdownMenuItem<Map>(
                          value: val,
                          child: Text(val["title"]),
                        );
                      }).toList(),
                      onChanged: (Map value) {
                        setState(() {
                          _con.language = value;
                          _con.languageError = '';
                        });
                      },
                    ),
                    errorText: _con.languageError,
                  ),
                  inputField(
                    icon: "assets/svg/planet.svg",
                    title: "Domain Name",
                    child: TextFormField(
                      initialValue: _con.domainName,
                      keyboardType: TextInputType.url,
                      cursorColor: AppColors.appColor,
                      onChanged: (val) => setState(() {
                        _con.domainName = val;
                        _con.domainNameError = '';
                      }),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                    errorText: _con.domainNameError,
                  ),
                  SizedBox(height: 20),
                  appButton(
                    onTap: () {
                      setState(() {
                        _con.businessNameError = '';
                        _con.emailError = '';
                        _con.currencyError = '';
                        _con.addressError = '';
                        _con.pinCodeError = '';
                        _con.countryError = '';
                        _con.stateError = '';
                        _con.cityError = '';
                        _con.languageError = '';
                        _con.domainNameError = '';
                      });
                      // if (_con.validateDetails(context)) {
                        // print("Ok done");
                        _con.onSavedBusinessDetails(context);
                      // } else {
                      //   print("Not done");
                      // }
                    },
                    text: "Save",
                  ),
                  heightBox(10),
                ],
              ),
            ),
    );
  }

  Widget inputField({
    String title,
    String icon,
    Widget child,
    String errorText,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          heightBox(5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.appColor),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  icon,
                  height: 25,
                ),
                widthBox(10),
                Expanded(
                  child: child == null ? Container() : child,
                ),
              ],
            ),
          ),
          errorText == "" ? Container() : SizedBox(height: 5),
          errorText == ""
              ? Container()
              : Text(
                  errorText,
                  style: TextStyle(color: Colors.red),
                ),
        ],
      ),
    );
  }

  Widget doubleInputField({
    String title1,
    String icon1,
    Widget child1,
    String title2,
    String icon2,
    Widget child2,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title1,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                heightBox(5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.appColor),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        icon1,
                        height: 25,
                      ),
                      widthBox(10),
                      Expanded(
                        child: child1 == null ? Container() : child1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          widthBox(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title2,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                heightBox(5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.appColor),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        icon2,
                        height: 25,
                      ),
                      widthBox(10),
                      Expanded(
                        child: child2 == null ? Container() : child2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
