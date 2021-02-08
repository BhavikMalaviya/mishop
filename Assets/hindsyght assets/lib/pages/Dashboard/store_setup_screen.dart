import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/helpers/helper.dart';
import 'package:micatalogs/helpers/variable_keys.dart';
import 'package:micatalogs/packages/size_config.dart';

class StoreSetupScreen extends StatefulWidget {
  @override
  _StoreSetupScreenState createState() => _StoreSetupScreenState();
}

class _StoreSetupScreenState extends State<StoreSetupScreen> {
  bool createStore = true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.appColor,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return WillPopScope(
      onWillPop: () async => Helper.onWillPop(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                heightBox(SizeConfig.safeBlockVertical * 2),
                Image(
                  height: SizeConfig.safeBlockVertical * 20,
                  image: AssetImage(
                    "assets/images/indicator.png",
                  ),
                ),
                heightBox(SizeConfig.safeBlockVertical * 2),
                Text(
                  "Finish Following Steps to unlock features.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.appColor,
                  ),
                ),
                heightBox(SizeConfig.safeBlockVertical * 5),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 90,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      storeListWidget(
                        active: createStore,
                        onTap: () async {
                          if (createStore) {
                            var res = await Navigator.pushNamed(
                                context, RouteKeys.UPDATEBUSINESSDETAIL);
                            if (res == true) {
                              setState(() {
                                createStore = false;
                              });
                            }
                          }
                        },
                        title: "Create Online Store",
                        description:
                            "Add your business detail to build your own online store.",
                        buttonName: "Create Store",
                        number: "1",
                      ),
                      heightBox(10),
                      storeListWidget(
                        active: createStore == false ? true : false,
                        onTap: () {
                          if (createStore == false) {
                            Navigator.pushNamed(context, RouteKeys.DASHBOARD);
                          }
                        },
                        title: "Add Product",
                        description:
                            "You can add your product & catalogs to your store and start selling",
                        buttonName: "Add Product",
                        number: "2",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget storeListWidget({
    String title,
    String number,
    String description,
    Function onTap,
    String buttonName,
    bool active,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: SizeConfig.safeBlockVertical * 6,
              height: SizeConfig.safeBlockVertical * 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: active ? Colors.black12 : Colors.transparent,
                border: Border.all(
                    color: active ? Colors.transparent : Colors.grey),
              ),
              child: Center(
                child: Text(
                  number,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            widthBox(10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        heightBox(5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: SizeConfig.safeBlockVertical * 6,
              child: Center(
                child: Container(
                  height: 100,
                  width: 0.2,
                  color: Colors.black,
                ),
              ),
            ),
            widthBox(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                  ),
                  heightBox(10),
                  InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: onTap,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.appColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        buttonName,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.whiteTextColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
