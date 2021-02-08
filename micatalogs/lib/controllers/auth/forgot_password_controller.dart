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

class ForgotPasswordController extends BaseController {
  String email = '';
  bool isLoading = false;
  String emailError = '';

  void invalidEmail() {
    setState(() => emailError = 'Enter valid email');
  }

  void validEmail() {
    setState(() => emailError = '');
  }

  bool validateInput() {
    if (email.isNotEmpty && Helper.isEmail(email)) {
      return true;
    } else {
      if (email.isEmpty || !Helper.isEmail(email)) {
        invalidEmail();
      }
      return false;
    }
  }

  forgetPassword(context) {
    final overlay = LoadingOverlay.of(context);
    overlay.show();
    proceed(context).then((isSucceed) {
      overlay.hide();
      if (isSucceed == true) {
        Navigator.pushNamed(context, RouteKeys.ENTEROTPSCREEN,
            arguments: RouteArgument(param: email));
      }
    });
  }

  Future proceed(context) async {
    try {
      Response response = await AuthRepo.sendEmailForgotPass(email: email);
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
              emailError = decoded['errors'].first['msg'];
            });
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
