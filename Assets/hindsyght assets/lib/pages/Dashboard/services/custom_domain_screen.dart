import 'package:flutter/material.dart';
import 'package:micatalogs/controllers/dashboard/services/custon_domain_controller.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class CustomDomainScreen extends StatefulWidget {
  @override
  _CustomDomainScreenState createState() => _CustomDomainScreenState();
}

class _CustomDomainScreenState extends StateMVC<CustomDomainScreen> {
  CustomDomainController _con;
  _CustomDomainScreenState() : super(CustomDomainController()) {
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
          'Custom Domain',
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
              data: _con.domainName,
              hintText: "Enter Domain Name",
              title: "Domain Name",
            ),
            inputField(
              data: _con.extraNote,
              hintText: "Type Note...",
              title: "Note",
              maxLines: 3,
            ),
            heightBox(10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.all(10),
              width: SizeConfig.safeBlockHorizontal * 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heightBox(10),
                  Text(
                    "Details:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  heightBox(10),
                  RichText(
                    text: TextSpan(
                      text:
                          "If you will purchase yearly plan. You can set custom domain in ",
                      style: TextStyle(
                        color: AppColors.lightTextColor,
                        fontFamily: "Poppins",
                      ),
                      children: [
                        TextSpan(
                          text: "FREE.",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontFamily: "Poppins",
                          ),
                        )
                      ],
                    ),
                  ),
                  heightBox(10),
                  RichText(
                    text: TextSpan(
                      text:
                          "If you will purchase monthly plan. You need to pay extra ",
                      style: TextStyle(
                        color: AppColors.lightTextColor,
                        fontFamily: "Poppins",
                      ),
                      children: [
                        TextSpan(
                          text: "\u20B9499.",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontFamily: "Poppins",
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            heightBox(20),
            appButton(
              onTap: () => Navigator.pop(context),
              text: "Submit",
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
    int maxLines,
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
                maxLines: maxLines,
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
