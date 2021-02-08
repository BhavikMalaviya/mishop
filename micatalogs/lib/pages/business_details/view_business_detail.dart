import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/helpers/variable_keys.dart';
import 'package:micatalogs/packages/size_config.dart';

class ViewBusinessDetails extends StatefulWidget {
  ViewBusinessDetails({Key key}) : super(key: key);

  @override
  _ViewBusinessDetailsState createState() => _ViewBusinessDetailsState();
}

class _ViewBusinessDetailsState extends State<ViewBusinessDetails> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appColor,
        iconTheme: IconThemeData(color: AppColors.whiteTextColor),
        title: Text(
          'Business Profile',
          style: TextStyle(
            color: AppColors.whiteTextColor,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.white),
            onPressed: () =>
                Navigator.pushNamed(context, RouteKeys.UPDATEBUSINESSDETAIL),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: SizeConfig.safeBlockHorizontal * 100,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: SizeConfig.safeBlockVertical * 20,
                    width: SizeConfig.safeBlockVertical * 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black12,
                    ),
                  ),
                  heightBox(10),
                  Text(
                    "MICRA FASHION",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  heightBox(5),
                  Text(
                    "Fashion Being Here",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.lightTextColor,
                    ),
                  ),
                ],
              ),
            ),
            heightBox(20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: Text(
                "Business Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            heightBox(20),
            doubleListTile(
                icon1: "assets/svg/currency.svg",
                text1: "INR",
                icon2: "assets/svg/phoneNo.svg",
                text2: "9988776655"),
            heightBox(20),
            listTileWidget(
              icon: "assets/svg/message.svg",
              text: "johndoe@gmail.com",
            ),
            heightBox(20),
            listTileWidget(
              icon: "assets/svg/planet.svg",
              text: "domainname",
            ),
            heightBox(20),
            listTileWidget(
              icon: "assets/svg/address.svg",
              text: "4899 Bolman Court, Champaign 61820 illinois.",
            ),
            heightBox(20),
            doubleListTile(
              icon1: "assets/svg/earth.svg",
              text1: "India",
              icon2: "assets/svg/state.svg",
              text2: "Gujarat",
            ),
            heightBox(20),
          ],
        ),
      ),
    );
  }

  Widget listTileWidget({
    String text,
    String icon,
  }) {
    return Container(
      child: Column(
        children: [
          heightBox(5),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widthBox(SizeConfig.safeBlockHorizontal * 10),
                SvgPicture.asset(
                  icon,
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                widthBox(20),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          heightBox(15),
          Container(
            alignment: Alignment.centerRight,
            child: Container(
              width: SizeConfig.safeBlockHorizontal * 90,
              color: AppColors.appColor,
              height: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget doubleListTile({
    String text1,
    String icon1,
    String text2,
    String icon2,
  }) {
    return Row(
      children: [
        Container(
          width: SizeConfig.safeBlockHorizontal * 45,
          child: Column(
            children: [
              heightBox(5),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widthBox(SizeConfig.safeBlockHorizontal * 10),
                    SvgPicture.asset(
                      icon1,
                      height: SizeConfig.safeBlockVertical * 3,
                    ),
                    widthBox(20),
                    Expanded(
                      child: Text(
                        text1,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              heightBox(15),
              Container(
                alignment: Alignment.centerRight,
                child: Container(
                  width: SizeConfig.safeBlockHorizontal * 35,
                  color: AppColors.appColor,
                  height: 0.5,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              heightBox(5),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widthBox(SizeConfig.safeBlockHorizontal * 10),
                    SvgPicture.asset(
                      icon2,
                      height: SizeConfig.safeBlockVertical * 3,
                    ),
                    widthBox(20),
                    Expanded(
                      child: Text(
                        text2,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              heightBox(15),
              Container(
                alignment: Alignment.centerRight,
                child: Container(
                  width: SizeConfig.safeBlockHorizontal * 45,
                  color: AppColors.appColor,
                  height: 0.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
