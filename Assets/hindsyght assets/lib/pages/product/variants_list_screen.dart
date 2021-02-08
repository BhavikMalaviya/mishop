import 'package:flutter/material.dart';
import 'package:micatalogs/controllers/product/variant_list_controller.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/helpers/variable_keys.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class VariantsListScreen extends StatefulWidget {
  @override
  _VariantsListScreenState createState() => _VariantsListScreenState();
}

class _VariantsListScreenState extends StateMVC<VariantsListScreen> {
  VariantsListController _con;
  _VariantsListScreenState() : super(VariantsListController()) {
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
          'Variation',
          style: TextStyle(
            color: AppColors.whiteTextColor,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.appColor,
        onPressed: () =>
            Navigator.pushNamed(context, RouteKeys.ADDEDITVARIANTS),
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Container(
            width: SizeConfig.safeBlockHorizontal * 100,
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black12.withOpacity(0.07),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                widthBox(10),
                Icon(Icons.search),
                widthBox(10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                    ),
                  ),
                ),
                widthBox(10),
              ],
            ),
          ),
          heightBox(10),
          Expanded(
            child: ListView.builder(
              itemCount: _con.varientsList.length,
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 20,
                        child: Center(
                          child: Text("${i + 1}"),
                        ),
                      ),
                      widthBox(10),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "${_con.varientsList[i]['option']}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                popUpButton(),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Type:",
                                  style: TextStyle(
                                    color: AppColors.lightTextColor,
                                  ),
                                ),
                                widthBox(5),
                                Text(
                                  "${_con.varientsList[i]['type']}",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget popUpButton() => PopupMenuButton<String>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'Edit',
            child: Text(
              "Edit",
            ),
          ),
          PopupMenuItem(
            value: 'Delete',
            child: Text(
              "Delete",
            ),
          ),
        ],
        onSelected: (val) {},
        child: Icon(
          Icons.more_vert_rounded,
          color: AppColors.appGreyColor,
        ),
      );
}
