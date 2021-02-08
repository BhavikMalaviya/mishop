import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:micatalogs/controllers/auth/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends StateMVC<ForgotPasswordScreen> {
  ForgotPasswordController _con;
  _ForgotPasswordScreenState() : super(ForgotPasswordController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              SvgPicture.asset("assets/svg/forgot_password.svg"),
              heightBox(SizeConfig.safeBlockVertical * 5),
              Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              heightBox(10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Enter the email address associated with your account',
                  textAlign: TextAlign.center,
                ),
              ),
              heightBox(SizeConfig.safeBlockVertical * 6),
              titleText("Email"),
              emailInput(),
              heightBox(5),
              _con.emailError == '' ? Container() : errorText(_con.emailError),
              heightBox(10),
              appButton(
                  onTap: () {
                    setState(() {
                      _con.emailError = '';
                    });
                    if (_con.validateInput()) {
                      _con.forgetPassword(context);
                    }
                  },
                  text: "Reset Password"),
              heightBox(10),
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
}
