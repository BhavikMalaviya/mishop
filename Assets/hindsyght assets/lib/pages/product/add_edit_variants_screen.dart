import 'package:flutter/material.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:micatalogs/controllers/product/add_edit_variants_controller.dart';

class AddEditVariantsScreen extends StatefulWidget {
  @override
  _AddEditVariantsScreenState createState() => _AddEditVariantsScreenState();
}

class _AddEditVariantsScreenState extends StateMVC<AddEditVariantsScreen> {
  AddEditVariantsController _con;
  _AddEditVariantsScreenState() : super(AddEditVariantsController()) {
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
          'Create Variation',
          style: TextStyle(
            color: AppColors.whiteTextColor,
          ),
        ),
        centerTitle: true,
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
                "Name",
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
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter variant name",
                ),
              ),
            ),
            heightBox(10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                "Type",
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
                  hint: Text("Select type"),
                  items: _con.variantType.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() => _con.variants = val);
                    if (val == "Text" || val == "Text Area") {
                      setState(() => _con.controllers = []);
                    } else {
                      if (_con.controllers.isEmpty) {
                        setState(() =>
                            _con.controllers.add(TextEditingController()));
                      }
                    }
                  },
                ),
              ),
            ),
            heightBox(10),
            _con.controllers.isEmpty
                ? Container()
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          "Values",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        TextButton.icon(
                          onPressed: () {
                            if (_con.controllers[_con.controllers.length - 1]
                                .text.isNotEmpty) {
                              setState(() => _con.controllers
                                  .add(TextEditingController()));
                            }
                          },
                          icon: Icon(Icons.add),
                          label: Text("Add Field"),
                        ),
                      ],
                    ),
                  ),
            _con.controllers.isEmpty ? Container() : heightBox(10),
            _con.controllers.isEmpty
                ? Container()
                : Column(
                    children: _con.controllers
                        .asMap()
                        .map(
                          (i, element) => MapEntry(
                            i,
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: AppColors.appColor),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: element,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Value Name",
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    child: Icon(
                                      Icons.remove_circle,
                                      color: Colors.red,
                                    ),
                                    onTap: () {
                                      if (_con.controllers.length != 1) {
                                        setState(
                                          () =>
                                              _con.controllers.remove(element),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .values
                        .toList(),
                  ),
            _con.controllers.isEmpty ? Container() : heightBox(10),
            heightBox(10),
            InkWell(
              borderRadius:
                  BorderRadius.circular(SizeConfig.safeBlockVertical * 4),
              onTap: () {},
              child: Container(
                height: SizeConfig.safeBlockVertical * 6,
                width: SizeConfig.safeBlockHorizontal * 45,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.safeBlockVertical * 4),
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
          ],
        ),
      ),
    );
  }
}
