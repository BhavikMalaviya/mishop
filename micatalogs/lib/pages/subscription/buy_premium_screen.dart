import 'package:flutter/material.dart';
import 'package:micatalogs/controllers/subscription/buy_premium_controller.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class BuyPremiumScreen extends StatefulWidget {
  @override
  _BuyPremiumScreenState createState() => _BuyPremiumScreenState();
}

class _BuyPremiumScreenState extends StateMVC<BuyPremiumScreen> {
  BuyPremiumController _con;
  _BuyPremiumScreenState() : super(BuyPremiumController()) {
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
          'Subscriptions',
          style: TextStyle(
            color: AppColors.whiteTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30, width: double.infinity),
            Container(
              width: SizeConfig.safeBlockHorizontal * 90,
              height: SizeConfig.safeBlockVertical * 7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.extraLightAppColor,
              ),
              child: Row(
                children: [
                  tabWidget(
                    onTap: () => setState(() => _con.current = 0),
                    color: _con.current == 0
                        ? AppColors.appColor
                        : Colors.transparent,
                    radius: BorderRadius.horizontal(
                      left: Radius.circular(10),
                    ),
                    text: "Trial",
                    textColor: _con.current == 0
                        ? AppColors.whiteTextColor
                        : Colors.black,
                  ),
                  tabWidget(
                    color: _con.current == 1
                        ? AppColors.appColor
                        : Colors.transparent,
                    text: "Monthly",
                    onTap: () => setState(() => _con.current = 1),
                    textColor: _con.current == 1
                        ? AppColors.whiteTextColor
                        : Colors.black,
                  ),
                  tabWidget(
                    onTap: () => setState(() => _con.current = 2),
                    color: _con.current == 2
                        ? AppColors.appColor
                        : Colors.transparent,
                    radius: BorderRadius.horizontal(
                      right: Radius.circular(10),
                    ),
                    text: "Yearly",
                    textColor: _con.current == 2
                        ? AppColors.whiteTextColor
                        : Colors.black,
                  ),
                ],
              ),
            ),
            heightBox(30),
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
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.appColor),
                    ),
                    child: Column(
                      children: [
                        Column(
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
                                            SizeConfig.safeBlockHorizontal * 12,
                                          ),
                                          Icon(Icons.done),
                                          widthBox(
                                            SizeConfig.safeBlockHorizontal * 5,
                                          ),
                                          Expanded(
                                            child: Text(
                                              _con.currentList[index],
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                              ),
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
                       heightBox(20),
                        Container(
                          height: SizeConfig.safeBlockVertical * 6,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal * 6),
                          decoration: BoxDecoration(
                            color: AppColors.appColor,
                            borderRadius: BorderRadius.circular(
                              SizeConfig.safeBlockVertical * 4,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Subscribe",
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
          ],
        ),
      ),
    );
  }

  Widget tabWidget(
      {String text,
      Color textColor,
      BorderRadius radius,
      Color color,
      Function onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: radius,
      child: Container(
        width: SizeConfig.safeBlockHorizontal * 30,
        height: SizeConfig.safeBlockVertical * 7,
        decoration: BoxDecoration(borderRadius: radius, color: color),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
