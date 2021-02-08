import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:micatalogs/elements/app_functions.dart';
import 'package:micatalogs/elements/loading_overlay.dart';
import 'package:micatalogs/helpers/helper.dart';
import 'package:micatalogs/repository/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/global.dart';
import '../../helpers/variable_keys.dart';
import '../base_controller.dart';

class LoginScreenController extends BaseController {
  String email = '';
  String emailError = '';
  String password = '';
  String passwordError = '';
  bool isLoading = false;
  String firstName = '';
  String lastName = '';
  String socialId = '';
  String socialType = '';
  String socialEmail = '';
  String deviceId = '';
  String deviceType = '';
  String deviceToken = '';

  void invalidEmail() {
    setState(() => emailError = 'Enter valid email');
  }

  void validEmail() {
    setState(() => emailError = '');
  }

  void invalidPassword() {
    setState(() => passwordError = 'Enter valid password');
  }

  void validPassword() {
    setState(() => passwordError = '');
  }

  bool validateInput() {
    if (email.isNotEmpty && Helper.isEmail(email) && password.isNotEmpty) {
      return true;
    } else {
      if (email.isEmpty || !Helper.isEmail(email)) {
        invalidEmail();
      }
      if (password.isEmpty) {
        invalidPassword();
      }
      return false;
    }
  }

  bool forgotPasswordValidate() {
    if (email.isNotEmpty && Helper.isEmail(email)) {
      return true;
    } else {
      if (email.isEmpty || !Helper.isEmail(email)) {
        invalidEmail();
      }
      return false;
    }
  }

  loginButtonPressed(context) {
    final overlay = LoadingOverlay.of(context);
    overlay.show();
    proceed(context).then((isSucceed) {
      overlay.hide();
      if (isSucceed == true) {
        Navigator.pushNamed(context, RouteKeys.DASHBOARD);
      } else if (isSucceed == "SETUP") {
        Navigator.pushNamed(context, RouteKeys.STORE_SETUP);
      }
    });
  }

  Future proceed(context) async {
    try {
      Response response =
          await AuthRepo.loginUser(email: email, password: password);
      var decoded = jsonDecode(response.body);
      print(decoded);
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(
          PrefsKey.USER_ID,
          decoded['data']['user']['_id'],
        );
        prefs.setString(
          PrefsKey.ACCESS_TOKEN,
          decoded['data']['token'],
        );
        Response res = await AuthRepo.availableStoreApi();
        if (res.statusCode == 404) {
          return "SETUP";
        } else {
          return true;
        }
      } else if (response.statusCode == 404) {
        var decoded = jsonDecode(response.body);
        toast(decoded['error']['message']);
      } else if (response.statusCode == 422) {
        var decoded = jsonDecode(response.body);
        toast(decoded['errors'][0]['msg']);
      } else if (response.statusCode == 503) {
        AppClass.internetNotConnection(response);
      }
    } catch (e) {
      print(e);
    }
  }
}
