import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/helpers/variable_keys.dart';
import 'package:micatalogs/packages/size_config.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.appColor,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to MiCatalogs! Set up your store and start selling",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              heightBox(SizeConfig.safeBlockVertical * 5),
              Image(
                height: SizeConfig.safeBlockVertical * 20,
                image: AssetImage(
                  "assets/images/shop.png",
                ),
              ),
              heightBox(SizeConfig.safeBlockVertical * 5),
              Text(
                "We're here to help you going through the most important steps to get your store up and running.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.lightTextColor,
                  fontSize: 16,
                ),
              ),
              heightBox(SizeConfig.safeBlockVertical * 5),
              InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, RouteKeys.STORE_SETUP),
                borderRadius:
                    BorderRadius.circular(SizeConfig.safeBlockVertical * 4),
                child: Container(
                  height: SizeConfig.safeBlockVertical * 7,
                  width: SizeConfig.safeBlockHorizontal * 80,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.safeBlockVertical * 4),
                    color: AppColors.appColor,
                  ),
                  child: Center(
                    child: Text(
                      "Continue store setup",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.whiteTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
