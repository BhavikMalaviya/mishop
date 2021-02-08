import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:micatalogs/helpers/variable_keys.dart';
import 'package:micatalogs/controllers/product/set_variants_controller.dart'; 

class SetVariantsScreen extends StatefulWidget {
  @override
  _SetVariantsScreenState createState() => _SetVariantsScreenState();
}

class _SetVariantsScreenState extends StateMVC<SetVariantsScreen> {
  SetVariantsController _con;
  _SetVariantsScreenState() : super(SetVariantsController()) {
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
          'Variations',
          style: TextStyle(
            color: AppColors.whiteTextColor,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.appColor,
        onPressed: () =>
            Navigator.pushNamed(context, RouteKeys.VARIANTSLISTSCREEN),
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: SizeConfig.safeBlockHorizontal * 100,
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                "Add Variation",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            heightBox(10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors.appColor),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _con.variants,
                  hint: Text("Select Variation"),
                  items: _con.varientsList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _con.variants = val),
                ),
              ),
            ),
            heightBox(20),
            Column(
              children: _con.colorList
                  .asMap()
                  .map(
                    (i, element) => MapEntry(
                      i,
                      Container(
                        margin: EdgeInsets.all(10),
                        width: SizeConfig.safeBlockHorizontal * 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(blurRadius: 5, color: Colors.black12),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "$element",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: SvgPicture.asset(
                                    "assets/svg/delete_.svg",
                                    height: 20,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                priceModifier(
                                  onTap: () => _con.onPlusMinusTap(),
                                  string1: "+",
                                  string2: "-",
                                  value: _con.isPlus,
                                ),
                                widthBox(10),
                                priceModifier(
                                  onTap: () => _con.onPricePercentageTap(),
                                  string1: "\$",
                                  string2: "%",
                                  value: _con.isPlusPrice,
                                ),
                                widthBox(10),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                          Border.all(color: AppColors.appColor),
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                        hintText: "\$ 0.00",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .values
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget priceModifier(
      {String string1, String string2, Function onTap, bool value}) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.appColor),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color:
                    value ? AppColors.appColor : AppColors.extraLightAppColor,
                border: Border.all(color: AppColors.appColor),
              ),
              child: Center(
                child: Text(
                  "$string1",
                  style: TextStyle(
                    fontSize: 16,
                    color: value ? AppColors.whiteTextColor : Colors.black,
                  ),
                ),
              ),
            ),
          ),
          widthBox(5),
          InkWell(
            onTap: onTap,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color:
                    !value ? AppColors.appColor : AppColors.extraLightAppColor,
                border: Border.all(color: AppColors.appColor),
              ),
              child: Center(
                child: Text(
                  "$string2",
                  style: TextStyle(
                    fontSize: 16,
                    color: !value ? AppColors.whiteTextColor : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
