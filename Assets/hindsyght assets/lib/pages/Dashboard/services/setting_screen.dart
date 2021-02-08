import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:micatalogs/controllers/dashboard/services/setting_controller.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends StateMVC<SettingScreen> {
  SettingController _con;
  _SettingScreenState() : super(SettingController()) {
    _con = controller;
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appColor,
        iconTheme: IconThemeData(
          color: AppColors.whiteTextColor,
        ),
        title: Text(
          'Settings',
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
            inputField(
              data: _con.chargePerOrder,
              hintText: "Enter Shipping Charge",
              title: "Charge Per Order",
            ),
            inputField(
              data: _con.freeDeliveryAbove,
              hintText: "Enter amount",
              title: "Free Delivery Above",
            ),
            heightBox(10),
            keyWidget(
              data: _con.facebookPixelKey,
              subTitle: "Enter Key ID",
              title: "Facebook Pixel",
            ),
            heightBox(15),
            keyWidget(
              data: _con.googleAnalyticsKey,
              subTitle: "Enter Tracking ID",
              title: "Google Analytics",
            ),
            heightBox(15),
            appButton(
              onTap: () => Navigator.pop(context),
              text: "Save",
            ),
            heightBox(15),
          ],
        ),
      ),
    );
  }

  Widget inputField({
    String title,
    String hintText,
    String data,
  }) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          heightBox(5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.appColor),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: TextFormField(
                onChanged: (val) => setState(() => data = val),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget keyWidget({
    String data,
    String title,
    String subTitle,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heightBox(10),
          Text(
            title,
            style: TextStyle(
              color: AppColors.appColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          heightBox(15),
          Text(
            subTitle,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          heightBox(10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/svg/colorkey.svg",
                ),
                widthBox(10),
                Container(
                  height: 50,
                  width: 1,
                  color: Colors.grey,
                ),
                widthBox(10),
                Expanded(
                  child: TextFormField(
                    onChanged: (val) => setState(() => data = val),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Key ID",
                      hintStyle: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          heightBox(10),
          Row(
            children: [
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Get Help ?",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
