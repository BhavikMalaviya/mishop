import 'package:flutter/material.dart';
import 'package:micatalogs/controllers/dashboard/profile/update_profile_controller.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends StateMVC<UpdateProfileScreen> {
  UpdateProfileController _con;
  _UpdateProfileScreenState() : super(UpdateProfileController()) {
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
          'Edit Profile',
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
              data: _con.fullName,
              hintText: "Enter Full Name",
              title: "Full Name",
            ),
            inputField(
              data: _con.email,
              hintText: "Enter Email id",
              title: "Email",
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phone Number",
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
                    child: Row(
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text("+ 91"),
                            icon: Container(),
                            value: _con.phoneCode,
                            items: _con.phoneCodeList.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text("+ $value"),
                              );
                            }).toList(),
                            onChanged: (val) =>
                                setState(() => _con.phoneCode = val),
                          ),
                        ),
                        widthBox(10),
                        Container(
                          height: 30,
                          width: 1,
                          color: Colors.grey,
                        ),
                        widthBox(10),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Enter Phone Number",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Country",
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
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: Text("Select Country"),
                        value: _con.country,
                        iconEnabledColor: AppColors.appColor,
                        iconSize: 30,
                        items: _con.countryList.map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (val) => setState(() => _con.country = val),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            heightBox(20),
            appButton(
              onTap: () => Navigator.pop(context),
              text: "Update Profile",
            ),
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
}
