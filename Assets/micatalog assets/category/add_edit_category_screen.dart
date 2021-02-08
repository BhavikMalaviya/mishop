import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/packages/switch.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:micatalogs/controllers/category/add_edit_category_controller.dart';

class AddEditCategoryScreen extends StatefulWidget {
  @override
  _AddEditCategoryScreenState createState() => _AddEditCategoryScreenState();
}

class _AddEditCategoryScreenState extends StateMVC<AddEditCategoryScreen> {
  AddEditCategoryController _con;
  _AddEditCategoryScreenState() : super(AddEditCategoryController()) {
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
        centerTitle: true,
        title: Text(
          'Add Category',
          style: TextStyle(
            color: AppColors.whiteTextColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: SizeConfig.safeBlockHorizontal * 100,
              height: 20,
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 15,
              width: SizeConfig.safeBlockVertical * 15,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.appColor,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Center(
                child: SvgPicture.asset("assets/svg/camera.svg"),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Add Logo",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            inputField(
              value: _con.title,
              title: "Title",
              hintText: "Enter category title",
            ),
            inputField(
              value: _con.title,
              title: "Parent Category",
              hintText: "Select parent category",
            ),
            inputField(
              value: _con.title,
              title: "Sub-Category",
              hintText: "Choose Category",
            ),
            heightBox(10),
            Row(
              children: [
                widthBox(10),
                Expanded(
                  child: Text(
                    "Featured Catalog",
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
                  onChanged: (val) {},
                  value: false,
                ),
                widthBox(10),
              ],
            ),
            heightBox(30),
            Row(
              children: <Widget>[
                widthBox(10),
                Expanded(
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
                widthBox(10),
                Expanded(
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
                widthBox(10),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget inputField({
    String title,
    String value,
    String hintText,
    TextInputType type,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          heightBox(5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.appColor),
            ),
            child: TextFormField(
              cursorColor: AppColors.appColor,
              keyboardType: type,
              onChanged: (val) => setState(() => value = val),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
