import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/helpers/helper.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:micatalogs/helpers/variable_keys.dart';
import 'package:micatalogs/controllers/auth/login_screen_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends StateMVC<LoginScreen> {
  LoginScreenController _con;
  _LoginScreenState() : super(LoginScreenController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return WillPopScope(
      onWillPop: () async => Helper.onWillPop(),
      child: Scaffold(
        body: SingleChildScrollView(
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
                      'assets/images/login.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Text(
                  "Welcome\nBack",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteTextColor,
                  ),
                ),
              ),
              heightBox(SizeConfig.safeBlockVertical * 2),
              titleText('Email'),
              heightBox(5),
              emailInput(),
              heightBox(5),
              _con.emailError == '' ? Container() : errorText(_con.emailError),
              heightBox(20),
              titleText('Password'),
              heightBox(5),
              passwordInput(),
              heightBox(5),
              _con.passwordError == ''
                  ? Container()
                  : errorText(_con.passwordError),
              // forgotPassword(),
              heightBox(20),
              loginButton(),
              heightBox(SizeConfig.safeBlockVertical * 12),
              bottomButtons(),
              heightBox(20),
            ],
          ),
        ),
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

  Widget emailInput() => Column(
        children: [
          Row(
            children: [
              widthBox(15),
              SvgPicture.asset(
                'assets/svg/message.svg',
                height: SizeConfig.safeBlockVertical * 3,
                color: AppColors.appColor,
              ),
              widthBox(20),
              Expanded(
                child: TextFormField(
                  onChanged: (val) => setState(() {
                    _con.email = val;
                    _con.emailError = '';
                  }),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your Email',
                    hintStyle: TextStyle(
                        color: AppColors.lightTextColor, fontSize: 14),
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

  Widget passwordInput() => Column(
        children: [
          Row(
            children: [
              widthBox(15),
              SvgPicture.asset(
                'assets/svg/keyIcon.svg',
                height: SizeConfig.safeBlockVertical * 3,
                color: AppColors.appColor,
              ),
              widthBox(20),
              Expanded(
                child: TextFormField(
                  obscureText: true,
                  onChanged: (val) => setState(() {
                    _con.password = val;
                    _con.passwordError = '';
                  }),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(
                        color: AppColors.lightTextColor, fontSize: 14),
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

  Widget loginButton() => Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Text(
              "Sign in",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  _con.emailError = '';
                  _con.passwordError = '';
                });
                if (_con.validateInput()) {
                  _con.loginButtonPressed(context);
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

  Widget bottomButtons() => Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            TextButton(
              onPressed: () => Navigator.pushNamed(context, RouteKeys.SIGN_UP),
              child: Text(
                "Sign up",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, RouteKeys.FORGOTPASSWORD),
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );
}
