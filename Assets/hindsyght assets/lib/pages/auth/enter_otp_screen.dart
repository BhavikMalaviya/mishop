import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/models/route_argument.dart';
import 'package:micatalogs/packages/otp_text_field.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:micatalogs/controllers/auth/otp_verification_controller.dart';

class EnterOTPScreen extends StatefulWidget {
  @override
  _EnterOTPScreenState createState() => _EnterOTPScreenState();
  final RouteArgument routeArgument;
  EnterOTPScreen({Key key, this.routeArgument}) : super(key: key);
}

class _EnterOTPScreenState extends StateMVC<EnterOTPScreen> {
  OtpVerificationController _con;
  _EnterOTPScreenState() : super(OtpVerificationController()) {
    _con = controller;
  }

  String otp;

  @override
  void initState() {
    _con.email = widget.routeArgument.param;
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
              SvgPicture.asset("assets/svg/enter_otp.svg"),
              heightBox(SizeConfig.safeBlockVertical * 5),
              Text(
                'Verify your email',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              heightBox(10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Please enter the 6 digit code sent to\n${_con.email}',
                  textAlign: TextAlign.center,
                ),
              ),
              heightBox(SizeConfig.safeBlockVertical * 8),
              OTPTextField(
                length: 6,
                width: SizeConfig.safeBlockHorizontal * 80,
                style: TextStyle(fontSize: 20),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onChanged: (val) => setState(() {
                  _con.otp = val;
                  _con.otpError = '';
                }),
                onCompleted: (pin) => _con.otp = pin,
              ),
              heightBox(20),
              _con.otpError == '' ? Container() : errorText(_con.otpError),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Resend Code",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              heightBox(SizeConfig.safeBlockVertical * 5),
              appButton(
                  onTap: () {
                    setState(() {
                      _con.otpError = '';
                    });
                    if (_con.validateInput()) {
                      _con.verifyOtp(context);
                    }
                  },
                  text: "Verify & Proceed"),
              heightBox(10.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget errorText(String text) => Container(
        width: SizeConfig.safeBlockHorizontal * 100,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textErrorColor,
          ),
        ),
      );
}