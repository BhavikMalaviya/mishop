import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:micatalogs/controllers/auth/confirm_password_controller.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/models/route_argument.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:micatalogs/helpers/global.dart';

class ConfirmPasswordScreen extends StatefulWidget {
  @override
  _ConfirmPasswordScreenState createState() => _ConfirmPasswordScreenState();
  final RouteArgument routeArgument;
  ConfirmPasswordScreen({Key key, this.routeArgument}) : super(key: key);
}

class _ConfirmPasswordScreenState extends StateMVC<ConfirmPasswordScreen> {
  ConfirmPasswordController _con;
  _ConfirmPasswordScreenState() : super(ConfirmPasswordController()) {
    _con = controller;
  }

  @override
  void initState() {
    _con.email = widget.routeArgument.param['email'];
    _con.otp = widget.routeArgument.param['otp'];
    super.initState();
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
              SvgPicture.asset("assets/svg/enter_password.svg"),
              heightBox(SizeConfig.safeBlockVertical * 5),
              Text(
                'Create new password',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              heightBox(10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Your new password must be diffrent from previous used password.',
                  textAlign: TextAlign.center,
                ),
              ),
              heightBox(SizeConfig.safeBlockVertical * 5),
              titleText("Password"),
              passwordInput(),
              heightBox(5),
              _con.passwordError == ''
                  ? Container()
                  : errorText(_con.passwordError),
              heightBox(15),
              titleText("Confirm Password"),
              confirmPasswordInput(),
              heightBox(5),
              _con.confirmPasswordError == ''
                  ? Container()
                  : errorText(_con.confirmPasswordError),
              heightBox(SizeConfig.safeBlockVertical * 5),
              appButton(
                  onTap: () => {
                        if (_con.validateInput()) {_con.resetPassword(context)}
                      },
                  text: "Reset Password"),
              heightBox(10.0),
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

  Widget confirmPasswordInput() => Column(
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
                    _con.confirmPassword = val;
                    _con.confirmPasswordError = '';
                  }),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your confirm password',
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