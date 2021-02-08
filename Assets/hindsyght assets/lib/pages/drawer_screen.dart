import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/helpers/variable_keys.dart';
import 'package:micatalogs/packages/size_config.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: double.infinity,
      width: SizeConfig.safeBlockHorizontal * 80,
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              heightBox(SizeConfig.safeBlockVertical * 5),
              Row(
                children: [
                  widthBox(15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Image(
                      height: SizeConfig.safeBlockVertical * 10,
                      width: SizeConfig.safeBlockVertical * 10,
                      image: AssetImage('assets/images/logo_icon.png'),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 30,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: AppColors.appColor,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Premium Store',
                        style: TextStyle(color: AppColors.whiteTextColor),
                      ),
                    ),
                  ),
                ],
              ),
              heightBox(10),
              Container(
                width: SizeConfig.safeBlockHorizontal * 80 - 20,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Micra Store',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                width: SizeConfig.safeBlockHorizontal * 80 - 20,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'micrastore@gmail.com',
                  style: TextStyle(
                    color: AppColors.lightTextColor,
                  ),
                ),
              ),
              Container(
                width: SizeConfig.safeBlockHorizontal * 80 - 20,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '+91 9988776655',
                  style: TextStyle(
                    color: AppColors.lightTextColor,
                  ),
                ),
              ),
              heightBox(10),
              Divider(),
              drawerWidget(
                descriptionText: 'Check your plan and expiry dates',
                icon: 'assets/svg/information.svg',
                onTap: () =>
                    Navigator.popAndPushNamed(context, RouteKeys.CURRENTPLAN),
                titleText: 'Current Plan',
              ),
              drawerWidget(
                descriptionText: 'Buy or extended your premium subscription',
                icon: 'assets/svg/premium.svg',
                onTap: () =>
                    Navigator.popAndPushNamed(context, RouteKeys.BUYPREMIUM),
                titleText: 'Buy Premium',
              ),
              drawerWidget(
                descriptionText:
                    'Set up your logo, phone number, address and other details',
                icon: 'assets/svg/businessBag.svg',
                onTap: () => Navigator.popAndPushNamed(
                    context, RouteKeys.BUSINESSDETAIL),
                titleText: 'Business Profile',
              ),
              drawerWidget(
                descriptionText: 'Share micatalogs with your friends',
                icon: 'assets/svg/share.svg',
                onTap: () {},
                titleText: 'Share MiCatalogs',
              ),
              heightBox(
                SizeConfig.safeBlockVertical * 5,
              ),
              // Spacer(),
              Text(
                'Version 2.7.5',
                style: TextStyle(color: AppColors.lightTextColor),
              ),
              heightBox(5),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerWidget({
    String icon,
    String titleText,
    String descriptionText,
    Function onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 80 - 20,
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                icon,
                width: 25,
              ),
              widthBox(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: SizeConfig.safeBlockVertical * 3.5,
                      child: Text(
                        '$titleText',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    heightBox(5),
                    Text(
                      '$descriptionText',
                      style: TextStyle(
                        color: AppColors.lightTextColor,
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
