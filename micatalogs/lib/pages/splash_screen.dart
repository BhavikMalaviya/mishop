import 'package:flutter/material.dart';
import 'package:micatalogs/helpers/variable_keys.dart';
import 'package:micatalogs/elements/app_loader.dart';
import 'package:micatalogs/helpers/app_config.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends StateMVC<SplashScreen> {
  SplashScreenController _con;
  SplashScreenState() : super(SplashScreenController()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
    // loadData();
    // _con.getPreferences(context);
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.of(context).pushReplacementNamed(RouteKeys.DASHBOARD);
    });
  }

  // void loadData() {
  //   _con.progress.addListener(() {
  //     double progress = 0;
  //     _con.progress.value.values.forEach((_progress) {
  //       progress += _progress;
  //     });
  //     if (progress == 100) {
  //       try {
  //         Navigator.of(context).pushReplacementNamed('/Pages', arguments: 2);
  //       } catch (e) {}
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Image.asset(
              //   'assets/images/logo.png',
              //   width: 150,
              //   fit: BoxFit.cover,
              // ),
              heightBox(50),
              AppLoader(),
              Text('${AppData.appName}'),
            ],
          ),
        ),
      ),
    );
  }
}
