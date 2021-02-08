import 'package:flutter/material.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/models/country_state_city_model.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/controllers/auth/register_screen_controller.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends StateMVC<RegisterScreen> {
  RegisterScreenController _con;
  _RegisterScreenState() : super(RegisterScreenController()) {
    _con = controller;
  }

  @override
  void initState() {
    _con.getCountryListApi(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: SizeConfig.safeBlockVertical * 100,
              width: SizeConfig.safeBlockHorizontal * 100,
              alignment: Alignment.bottomRight,
              child: Image(
                image: AssetImage(
                  'assets/images/register2.png',
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: SizeConfig.safeBlockVertical * 40,
                  width: SizeConfig.safeBlockHorizontal * 100,
                  padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: SizeConfig.safeBlockVertical * 10),
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/register.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Text(
                    "Create\nAccount",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteTextColor,
                    ),
                  ),
                ),
                heightBox(SizeConfig.safeBlockVertical * 2),
                titleText('Name'),
                inputField(
                  image: "assets/svg/person.svg",
                  inputWidget: TextFormField(
                    onChanged: (val) => setState(() {
                      _con.fullName = val;
                      _con.fullNameError = '';
                    }),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your name",
                      hintStyle: TextStyle(
                          color: AppColors.lightTextColor, fontSize: 14),
                    ),
                  ),
                ),
                heightBox(5),
                _con.fullNameError == ''
                    ? Container()
                    : errorText(_con.fullNameError),
                heightBox(15),
                titleText('Email'),
                inputField(
                  inputWidget: TextFormField(
                    onChanged: (val) => setState(() {
                      _con.email = val;
                      _con.emailError = '';
                    }),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your name",
                      hintStyle: TextStyle(
                          color: AppColors.lightTextColor, fontSize: 14),
                    ),
                  ),
                  image: "assets/svg/message.svg",
                ),
                heightBox(5),
                _con.emailError == ''
                    ? Container()
                    : errorText(_con.emailError),
                heightBox(15),
                titleText('Phone No'),
                inputField(
                  inputWidget: TextFormField(
                    onChanged: (val) => setState(() {
                      _con.phoneNo = val;
                      _con.phoneNoError = '';
                    }),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your phone no",
                      hintStyle: TextStyle(
                          color: AppColors.lightTextColor, fontSize: 14),
                    ),
                  ),
                  image: "assets/svg/phoneNo.svg",
                ),
                heightBox(5),
                _con.phoneNoError == ''
                    ? Container()
                    : errorText(_con.phoneNoError),
                heightBox(15),
                titleText('Password'),
                inputField(
                  inputWidget: TextFormField(
                    onChanged: (val) => setState(() {
                      _con.password = val;
                      _con.passwordError = '';
                    }),
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your password",
                      hintStyle: TextStyle(
                          color: AppColors.lightTextColor, fontSize: 14),
                    ),
                  ),
                  image: "assets/svg/keyIcon.svg",
                ),
                heightBox(5),
                _con.passwordError == ''
                    ? Container()
                    : errorText(_con.passwordError),
                heightBox(15),
                titleText('Country'),
                countryInput(),
                heightBox(5),
                _con.countryError == ''
                    ? Container()
                    : errorText(_con.countryError),
                heightBox(20),
                signUpButton(),
                heightBox(SizeConfig.safeBlockVertical * 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                heightBox(20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget titleText(String text) => Container(
        width: SizeConfig.safeBlockHorizontal * 100,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      );

  Widget errorText(String text) => Container(
        width: SizeConfig.safeBlockHorizontal * 100,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textErrorColor,
          ),
        ),
      );

  Widget inputField({
    String image,
    Widget inputWidget,
  }) =>
      Column(
        children: [
          Row(
            children: [
              widthBox(15),
              SvgPicture.asset(
                image,
                height: SizeConfig.safeBlockVertical * 3,
                color: AppColors.appColor,
              ),
              widthBox(20),
              Expanded(
                child: inputWidget,
              ),
              widthBox(15),
            ],
          ),
          heightBox(5),
          Container(
            margin: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 10),
            height: 0.4,
            color: Colors.grey,
          ),
        ],
      );

  Widget countryInput() => Column(
        children: [
          Row(
            children: [
              widthBox(15),
              SvgPicture.asset(
                "assets/svg/earth.svg",
                height: SizeConfig.safeBlockVertical * 3,
                color: AppColors.appColor,
              ),
              widthBox(20),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<CountryModel>(
                    isExpanded: true,
                    value: _con.country,
                    hint: Text(
                      "Select Country",
                      style: TextStyle(color: Colors.grey),
                    ),
                    items: _con.countryList.map((CountryModel value) {
                      return new DropdownMenuItem<CountryModel>(
                        value: value,
                        child: new Text(value.name),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _con.country = val),
                  ),
                ),
              ),
              widthBox(15),
            ],
          ),
          heightBox(5),
          Container(
            margin: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 10),
            height: 0.4,
            color: Colors.grey,
          ),
        ],
      );

  Widget signUpButton() => Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Text(
              "Sign up",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  _con.fullNameError = '';
                  _con.phoneNoError = '';
                  _con.emailError = '';
                  _con.countryError = '';
                  _con.passwordError = '';
                });
                if (_con.validateInput()) {
                  _con.registerButtonPressed(context);
                }
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_forward,
                    color: AppColors.appColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
