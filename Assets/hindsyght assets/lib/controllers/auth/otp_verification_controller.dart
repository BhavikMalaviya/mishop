import 'dart:convert';
import 'package:http/http.dart';
import 'package:micatalogs/models/route_argument.dart';
import '../base_controller.dart';
import 'package:flutter/material.dart';
import 'package:micatalogs/helpers/helper.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/repository/auth_repo.dart';
import 'package:micatalogs/helpers/variable_keys.dart';
import 'package:micatalogs/elements/loading_overlay.dart';

class OtpVerificationController extends BaseController {
  String email = '';
  String otp = '';
  bool isLoading = false;
  String otpError = '';

  void invalidOtp() {
    setState(() => otpError = 'Enter valid otp');
  }

  bool validateInput() {
    if (otp.isNotEmpty && Helper.isOtp(otp)) {
      return true;
    } else {
      if (otp.isEmpty || !Helper.isOtp(otp)) {
        invalidOtp();
      }
      return false;
    }
  }

  verifyOtp(context) {
    final overlay = LoadingOverlay.of(context);
    overlay.show();
    proceed(context).then((isSucceed) {
      overlay.hide();
      if (isSucceed == true) {
        Navigator.pushNamed(context, RouteKeys.CONFIRMPASSWORDSCREEN,
            arguments: RouteArgument(
              param: {'email': email, "otp": otp},
            ));
      }
    });
  }

  Future proceed(context) async {
    try {
      Response response =
          await AuthRepo.otpVerification(email: email, otp: otp);
      debugPrint(response.statusCode.toString());
      debugPrint(response.body.toString());
      if (response.statusCode == 200) {
        var decoded = jsonDecode(response.body);
        toast(decoded['message']);
        return true;
      } else if (response.statusCode == 422) {
        var decoded = jsonDecode(response.body);
        if (decoded['errors'] is List) {
          if (decoded.containsKey('errors')) {
            setState(() {
              otpError = decoded['errors'].first['msg'];
            });
          }
        }
      } else if (response.statusCode == 404) {
        var decoded = jsonDecode(response.body);
        toast(decoded['error']['message']);
      }
    } catch (e) {
      print(e);
    }
  }
}
