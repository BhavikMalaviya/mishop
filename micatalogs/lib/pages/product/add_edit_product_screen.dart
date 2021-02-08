import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:micatalogs/controllers/product/add_edit_product_contoller.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/helpers/variable_keys.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AddEditProductScreen extends StatefulWidget {
  @override
  _AddEditProductScreenState createState() => _AddEditProductScreenState();
}

class _AddEditProductScreenState extends StateMVC<AddEditProductScreen> {
  AddEditProductController _con;
  _AddEditProductScreenState() : super(AddEditProductController()) {
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
          'Add Product',
          style: TextStyle(
            color: AppColors.whiteTextColor,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, RouteKeys.PRODUCTSETTINGSCREEN),
          ),
        ],
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
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
              ),
              child: Column(
                children: [
                  inputField(
                    value: _con.title,
                    title: "Title",
                    hintText: "Enter product title",
                  ),
                  inputField(
                    value: _con.description,
                    title: "Description",
                    maxLine: 3,
                    hintText: "Product Description",
                  ),
                  inputField(
                    value: _con.title,
                    title: "Category",
                    hintText: "Choose Category",
                  ),
                ],
              ),
            ),
            heightBox(20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heightBox(10),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Pricing",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  doubleInputField(
                    value: _con.title,
                    title: "Price",
                    hintText: "\$ 0.00",
                    value2: _con.title,
                    title2: "Discount Price",
                    hintText2: "\$ 0.00",
                  ),
                  doubleInputField(
                    value: _con.title,
                    title: "Available Quantity",
                    hintText: "0.00",
                    value2: _con.title,
                    title2: "Maximum Quantity",
                    hintText2: "0.00",
                  ),
                ],
              ),
            ),
            heightBox(20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Variants",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    width: SizeConfig.safeBlockHorizontal * 100,
                  ),
                  Text(
                    "Add varients if this product comes in multiple versions, like different sizes and colors.",
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(
                        context, RouteKeys.SETVARIANTSCREEN),
                    child: Text(
                      "VARIANTS",
                      style: TextStyle(color: AppColors.appColor),
                    ),
                  ),
                ],
              ),
            ),
            heightBox(20),
          ],
        ),
      ),
    );
  }

  Widget inputField({
    String title,
    String value,
    String hintText,
    int maxLine,
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
              maxLines: maxLine,
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

  Widget doubleInputField({
    String title,
    String value,
    String hintText,
    int maxLine,
    TextInputType type,
    String title2,
    String value2,
    String hintText2,
    int maxLine2,
    TextInputType type2,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
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
                    maxLines: maxLine,
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
          ),
          widthBox(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title2,
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
                    maxLines: maxLine2,
                    cursorColor: AppColors.appColor,
                    keyboardType: type2,
                    onChanged: (val) => setState(() => value2 = val),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText2,
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}