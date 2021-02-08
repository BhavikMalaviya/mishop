import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/helpers/variable_keys.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ServicesScreen extends StatefulWidget {
  final Function onTap;
  ServicesScreen({this.onTap});

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends StateMVC<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appColor,
        leading: IconButton(
          icon: Icon(Icons.dehaze),
          onPressed: widget.onTap,
          color: AppColors.whiteTextColor,
        ),
        title: Text(
          'Services',
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
            serviceTileWidget(
              image: "assets/svg/web.svg",
              onTap: () => Navigator.pushNamed(context, RouteKeys.CUSTOMDOMAIN),
              shortDes:
                  "Custom domain allow you to serve your site from domain.",
              title: "Custom Domain",
            ),
            serviceTileWidget(
              image: "assets/svg/setting.svg",
              onTap: () =>
                  Navigator.pushNamed(context, RouteKeys.SETTINGSCREEN),
              shortDes: "Manage your store's setting",
              title: "Setting",
            ),
            serviceTileWidget(
              image: "assets/svg/person.svg",
              onTap: () {},
              shortDes: "Get to know your customers",
              title: "Customers",
            ),
            serviceTileWidget(
              image: "assets/svg/vector.svg",
              onTap: () =>
                  Navigator.pushNamed(context, RouteKeys.BANNERLISTSCREEN),
              shortDes: "Set and manage your store's banners",
              title: "Store Banners",
            ),
            serviceTileWidget(
              image: "assets/svg/worldwide.svg",
              onTap: () {},
              shortDes: "Set the language across the entire world",
              title: "Language",
            ),
            serviceTileWidget(
              image: "assets/svg/support.svg",
              onTap: () {},
              shortDes: "Continue to contact MiCatalogs support.",
              title: "Support",
            ),
            serviceTileWidget(
              image: "assets/svg/paymentMethod.svg",
              onTap: () => Navigator.pushNamed(context, RouteKeys.PAYMENTLISTSCREEN),
              shortDes: "Enable and manage your store's payment method.",
              title: "Payment Method",
            ),
          ],
        ),
      ),
    );
  }

  Widget serviceTileWidget(
      {String title, String shortDes, Function onTap, String image}) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            onTap: onTap,
            leading: SvgPicture.asset(
              image,
              height: 25,
              width: 25,
            ),
            title: Text(title),
            subtitle: Text(shortDes),
          ),
          Container(
            width: SizeConfig.safeBlockHorizontal * 100,
            height: 0.4,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
