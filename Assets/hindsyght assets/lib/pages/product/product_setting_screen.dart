import 'package:flutter/material.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:micatalogs/packages/switch.dart';

class ProductSettingScreen extends StatefulWidget {
  @override
  _ProductSettingScreenState createState() => _ProductSettingScreenState();
}

class _ProductSettingScreenState extends State<ProductSettingScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appColor,
        iconTheme: IconThemeData(color: AppColors.whiteTextColor),
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
            listTile(text1: "New arrival", val: true),
            listTile(text1: "Featured in story", val: true),
            listTile(text1: "Enable", val: false),
            listTile(text1: "Auto deduct quantity", val: true),
            listTile(text1: "Allow order on out of stock", val: false),
            listTile(text1: "Stock availability", val: true),
            heightBox(25),
            Row(
              children: <Widget>[
                widthBox(10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: SizeConfig.safeBlockVertical * 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            SizeConfig.safeBlockVertical * 4),
                        color: AppColors.appColor,
                      ),
                      child: Center(
                        child: Text(
                          "Save",
                          style: TextStyle(
                              color: AppColors.whiteTextColor, fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                ),
                widthBox(10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: SizeConfig.safeBlockVertical * 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            SizeConfig.safeBlockVertical * 4),
                        color: Colors.black12,
                      ),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                widthBox(10),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget listTile({String text1, bool val}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              widthBox(10),
              Expanded(
                child: Text(
                  text1,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              widthBox(5),
              CustomSwitch(
                activeColor: AppColors.appColor,
                inactiveColor: Colors.black12,
                onChanged: (value) => setState(() => val = value),
                value: val,
              ),
              widthBox(10),
            ],
          ),
        ),
        Container(
          height: 1,
          width: SizeConfig.safeBlockHorizontal * 95,
          color: Colors.grey,
        ),
      ],
    );
  }
}
