import 'dart:convert';
import 'package:http/http.dart';
import '../base_controller.dart';
import 'package:flutter/material.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/repository/auth_repo.dart';
import 'package:micatalogs/helpers/variable_keys.dart';
import 'package:micatalogs/elements/loading_overlay.dart';

class ConfirmPasswordController extends BaseController {
  String password = '';
  String passwordError = '';
  String confirmPassword = "";
  String confirmPasswordError = "";
  String email = "";
  String otp = "";

  void invalidConfirmPassword() {
    setState(() => confirmPasswordError = 'Enter valid confirm password');
  }

  void validConfirmPassword() {
    setState(() => confirmPasswordError = '');
  }

  void invalidPassword() {
    setState(() => passwordError = 'Enter valid password');
  }

  void validPassword() {
    setState(() => passwordError = '');
  }

  bool validateInput() {
    if (password.isNotEmpty && confirmPassword.isNotEmpty) {
      if (password == confirmPassword) {
        return true;
      } else {
        invalidConfirmPassword();
        return false;
      }
    } else {
      if (password.isEmpty) {
        invalidPassword();
      }
      if (confirmPassword.isEmpty) {
        invalidConfirmPassword();
      }
      return false;
    }
  }

  resetPassword(context) {
    final overlay = LoadingOverlay.of(context);
    overlay.show();
    proceed(context).then((isSucceed) {
      overlay.hide();
      if (isSucceed == true) {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteKeys.LOGIN, (route) => false);
      }
    });
  }

  Future proceed(context) async {
    try {
      Response response = await AuthRepo.resetPassword(
          email: email, otp: otp.toString(), password: password.toString());
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
              passwordError = decoded['errors'].first['msg'];
            });
          }
        }
      } else if (response.statusCode == 404) {
        var decoded = jsonDecode(response.body);
        toast(decoded['error']);
      }
    } catch (e) {
      print(e);
    }
  }
}
