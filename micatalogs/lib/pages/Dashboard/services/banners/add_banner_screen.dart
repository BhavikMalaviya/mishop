import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:micatalogs/controllers/dashboard/services/banners/add_banner_controller.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AddBannerScreen extends StatefulWidget {
  @override
  _AddBannerScreenState createState() => _AddBannerScreenState();
}

class _AddBannerScreenState extends StateMVC<AddBannerScreen> {
  AddBannerController _con;
  _AddBannerScreenState() : super(AddBannerController()) {
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
          'Add Banner',
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
              height: SizeConfig.safeBlockVertical * 25,
              width: SizeConfig.safeBlockHorizontal * 100,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.appColor),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_a_photo,
                  ),
                  heightBox(10),
                  Text("Select Banner"),
                ],
              ),
            ),
            heightBox(20),
            Container(
              width: SizeConfig.safeBlockHorizontal * 100,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                  ),
                ],
              ),
            ),
            keyWidget(
              data: _con.url,
              title: "Navigation Link",
              noteText: "Note : Your Banner size must be in [1920px * 500px]",
            ),
            heightBox(20),
            appButton(
              onTap: () => Navigator.pop(context),
              text: "Add Banner",
            ),
            heightBox(20),
          ],
        ),
      ),
    );
  }

  Widget keyWidget({
    String data,
    String title,
    String noteText,
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
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppColors.appColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColors.appColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/svg/link.svg",
                    height: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          heightBox(20),
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
                  "assets/svg/link.svg",
                  height: 20,
                  color: AppColors.appColor,
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
                      hintText: "Enter URL",
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
          Text(
            noteText,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
