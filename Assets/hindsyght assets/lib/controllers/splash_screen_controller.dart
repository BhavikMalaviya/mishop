import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:micatalogs/elements/app_functions.dart';
import 'package:micatalogs/helpers/variable_keys.dart';
import 'package:micatalogs/repository/auth_repo.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends ControllerMVC {
  ValueNotifier<Map<String, double>> progress = new ValueNotifier(new Map());
  GlobalKey<ScaffoldState> scaffoldKey;

  SplashScreenController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    progress.value = {"Setting": 0, "User": 0};
  }

  void getPreferences(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(PrefsKey.ACCESS_TOKEN) == null) {
      Navigator.of(context).pushReplacementNamed(RouteKeys.LOGIN);
    } else {
      Response res = await AuthRepo.availableStoreApi();
      if (res.statusCode == 200) {
        Navigator.of(context).pushReplacementNamed(RouteKeys.DASHBOARD);
      } else if (res.statusCode == 503) {
        AppClass.internetNotConnection(res);
        Navigator.of(context).pushReplacementNamed(RouteKeys.LOGIN);
      } else if (res.statusCode == 404) {
        Navigator.of(context).pushReplacementNamed(RouteKeys.STORE_SETUP);
      } else {
        Navigator.of(context).pushReplacementNamed(RouteKeys.LOGIN);
      }
    }
  }
}
