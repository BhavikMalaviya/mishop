import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:micatalogs/controllers/category/category_action_controller.dart';

class CategoryActionDialog extends StatefulWidget {
  @override
  _CategoryActionDialogState createState() => _CategoryActionDialogState();
}

class _CategoryActionDialogState extends StateMVC<CategoryActionDialog> {
  CategoryActionController _con;
  _CategoryActionDialogState() : super(CategoryActionController()) {
    _con = controller;
  }
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      height: SizeConfig.safeBlockVertical * 42,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Category Action',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.appColor,
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: new BoxDecoration(
                        color: Colors.orange.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.edit_outlined,
                        color: Colors.orange,
                      ),
                    ),
                    heightBox(8),
                    Text(
                      'Edit',
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: new BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.share_outlined,
                          color: Colors.blue,
                        )),
                    heightBox(8),
                    Text(
                      'Share',
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: new BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.share_outlined,
                        color: Colors.green,
                      ),
                    ),
                    heightBox(8),
                    Text(
                      'Whatsapp',
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: new BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.red,
                      ),
                    ),
                    heightBox(8),
                    Text(
                      'Delete',
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: new BoxDecoration(
                        color: Colors.purple.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.share_outlined,
                        color: Colors.purple,
                      ),
                    ),
                    heightBox(8),
                    Text(
                      'Share PDF',
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: new BoxDecoration(
                        color: Color(0XFFfca3cc).withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite_outline_rounded,
                        color: Color(0XFFfca3cc),
                      ),
                    ),
                    heightBox(8),
                    Text(
                      'Favorite',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
