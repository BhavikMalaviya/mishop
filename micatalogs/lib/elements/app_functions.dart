import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/helpers/variable_keys.dart';

class AppClass {
  static unAuthenticatedUser(context, response) {
    var decoded = jsonDecode(response.body);
    toast(decoded['error']['message']);
    Navigator.pushNamedAndRemoveUntil(
        context, RouteKeys.LOGIN, (route) => false);
  }

  static internetNotConnection(response) {
    var decoded = jsonDecode(response.body);
    toast(decoded['message']);
  }
}
