import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:micatalogs/controllers/dashboard/profile/profile_screen_controller.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/helpers/variable_keys.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ProfileScreen extends StatefulWidget {
  final Function onTap;
  ProfileScreen({this.onTap});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends StateMVC<ProfileScreen> {
  ProfileScreenController _con;
  _ProfileScreenState() : super(ProfileScreenController()) {
    _con = controller;
  }

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
          'Profile',
          style: TextStyle(
            color: AppColors.whiteTextColor,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            color: AppColors.whiteTextColor,
            onPressed: () =>
                Navigator.pushNamed(context, RouteKeys.UPDATEPROFILE),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            heightBox(20),
            listTileWidget(
              icon: "assets/svg/person.svg",
              text: "Anna Alvarido",
              title: "Name",
            ),
            heightBox(20),
            listTileWidget(
              icon: "assets/svg/message.svg",
              text: "annaalvarido@gmail.com",
              title: "Email",
            ),
            heightBox(20),
            listTileWidget(
              icon: "assets/svg/phoneNo.svg",
              text: "+91 9988776655",
              title: "Phone Number",
            ),
            heightBox(20),
            listTileWidget(
              icon: "assets/svg/earth.svg",
              text: "India",
              title: "Country",
            ),
            heightBox(SizeConfig.safeBlockVertical * 10),
            appButton(
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, RouteKeys.LOGIN, (route) => false),
                text: "Logout"),
          ],
        ),
      ),
    );
  }

  Widget listTileWidget({
    String title,
    String text,
    String icon,
  }) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(
              icon,
              height: SizeConfig.safeBlockVertical * 3.5,
            ),
            title: Text(
              text,
              style: TextStyle(
                color: AppColors.lightTextColor,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Container(
              width: SizeConfig.safeBlockHorizontal * 85,
              color: Colors.grey,
              height: 0.4,
            ),
          ),
        ],
      ),
    );
  }
}
