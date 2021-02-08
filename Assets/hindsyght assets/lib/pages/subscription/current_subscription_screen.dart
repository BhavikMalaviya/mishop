import 'package:flutter/material.dart';
import 'package:micatalogs/controllers/subscription/current_subscription_controller.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/packages/lenear_process_indicator.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class CurrentSubscriptionScreen extends StatefulWidget {
  CurrentSubscriptionScreen({Key key}) : super(key: key);

  @override
  _CurrentSubscriptionScreenState createState() =>
      _CurrentSubscriptionScreenState();
}

class _CurrentSubscriptionScreenState
    extends StateMVC<CurrentSubscriptionScreen> {
  CurrentSubscriptionController _con;
  _CurrentSubscriptionScreenState() : super(CurrentSubscriptionController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appColor,
        iconTheme: IconThemeData(color: AppColors.whiteTextColor),
        title: Text(
          'Plan Details',
          style: TextStyle(
            color: AppColors.whiteTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            heightBox(20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "14 Days",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "9 Days",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Trial Period",
                      ),
                      Spacer(),
                      Text(
                        "Remaining Period",
                      ),
                    ],
                  ),
                  heightBox(10),
                  LinearPercentIndicator(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    lineHeight: 15,
                    progressColor: AppColors.appColor,
                    percent: 0.8,
                  ),
                  heightBox(20),
                  Row(
                    children: [
                      planContainer(text1: "Current Plan", text2: "Monthly"),
                      widthBox(10),
                      planContainer(text1: "Expiry Date", text2: "25-10-2020"),
                      widthBox(10),
                      planContainer(text1: "Remaining Time", text2: "9 Days"),
                    ],
                  ),
                ],
              ),
            ),
            heightBox(20),
            Container(
              width: SizeConfig.safeBlockHorizontal * 100,
              margin: EdgeInsets.only(
                right: SizeConfig.safeBlockHorizontal * 10,
                left: SizeConfig.safeBlockHorizontal * 10,
              ),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: SizeConfig.safeBlockVertical * 4,
                    ),
                    padding: EdgeInsets.only(
                      top: SizeConfig.safeBlockVertical * 6,
                      bottom: SizeConfig.safeBlockVertical * 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.black12,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _con.currentList
                          .asMap()
                          .map(
                            (index, value) => MapEntry(
                              index,
                              Column(
                                children: [
                                  heightBox(10),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      widthBox(
                                          SizeConfig.safeBlockHorizontal * 12),
                                      Icon(Icons.done),
                                      widthBox(
                                          SizeConfig.safeBlockHorizontal * 5),
                                      Expanded(
                                        child: Text(
                                          _con.currentList[index],
                                        ),
                                      ),
                                      widthBox(10),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                          .values
                          .toList(),
                    ),
                  ),
                  Positioned(
                    left: SizeConfig.safeBlockHorizontal * 12,
                    right: SizeConfig.safeBlockHorizontal * 12,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.safeBlockVertical * 2.5),
                      decoration: BoxDecoration(
                        color: AppColors.appColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Monthly 179",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors.whiteTextColor,
                            ),
                          ),
                          widthBox(2),
                          Text(
                            "INR",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.whiteTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            heightBox(20),
          ],
        ),
      ),
    );
  }

  Widget planContainer({String text1, String text2}) {
    return Expanded(
      child: Container(
        height: SizeConfig.safeBlockVertical * 15,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black12,
            )
          ],
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              textAlign: TextAlign.center,
            ),
            heightBox(5),
            Text(
              text2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
