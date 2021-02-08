import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/packages/size_config.dart';

toast(String message) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
      msg: "$message",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: Colors.black,
      fontSize: 16.0);
}

Widget heightBox(double height) => SizedBox(
      height: height,
    );
Widget widthBox(double width) => SizedBox(
      width: width,
    );

Widget appButton({Function onTap, String text}) => RaisedButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            color: AppColors.appColor,
            borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          constraints: BoxConstraints(
              maxWidth: SizeConfig.safeBlockHorizontal * 90, minHeight: 45.0),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.whiteTextColor, fontSize: 16),
          ),
        ),
      ),
    );
