import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:micatalogs/controllers/dashboard/services/banners/banner_list_controller.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/helpers/variable_keys.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class BannerListScreen extends StatefulWidget {
  @override
  _BannerListScreenState createState() => _BannerListScreenState();
}

class _BannerListScreenState extends StateMVC<BannerListScreen> {
  BannerListController _con;
  _BannerListScreenState() : super(BannerListController()) {
    _con = controller;
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.appColor,
        onPressed: () =>
            Navigator.pushNamed(context, RouteKeys.ADDBANNERSCREEN),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appColor,
        iconTheme: IconThemeData(color: AppColors.whiteTextColor),
        title: Text(
          'Store Banners',
          style: TextStyle(
            color: AppColors.whiteTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => Container(
          height: SizeConfig.safeBlockVertical * 40,
          padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 15),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 0.4,
              ),
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: SizeConfig.safeBlockVertical * 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.appColor,
                ),
              ),
              Positioned(
                bottom: SizeConfig.safeBlockVertical * 1,
                right: 20,
                left: 20,
                child: Container(
                  height: SizeConfig.safeBlockVertical * 8,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(blurRadius: 5, color: Colors.black26),
                    ],
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/link.svg",
                        color: AppColors.appColor,
                        height: SizeConfig.safeBlockVertical * 3,
                      ),
                      widthBox(10),
                      Container(
                        height: SizeConfig.safeBlockVertical * 8,
                        width: 1,
                        color: Colors.grey,
                      ),
                      widthBox(10),
                      Expanded(
                        child: Text(
                          "https://demo.micatalogs.com/",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12, color: AppColors.lightTextColor),
                        ),
                      ),
                    ],
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
