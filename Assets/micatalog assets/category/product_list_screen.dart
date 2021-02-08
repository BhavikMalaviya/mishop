import 'package:flutter/material.dart';
import 'package:micatalogs/controllers/category/product_list_controller.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class CategoryWiseProducts extends StatefulWidget {
  @override
  _CategoryWiseProductsState createState() => _CategoryWiseProductsState();
}

class _CategoryWiseProductsState extends StateMVC<CategoryWiseProducts> {
  ProductListController _con;
  _CategoryWiseProductsState() : super(ProductListController()) {
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
          'Category Name',
          style: TextStyle(
            color: AppColors.whiteTextColor,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 51,
        itemBuilder: (_, index) => productCard(index: index),
      ),
    );
  }

  productCard({int index}) => Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Card(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        child: Image.network(
                          'https://picsum.photos/id/${index + 10}/200/300',
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    widthBox(10),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Product title $index',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text('50 views',
                                                style: TextStyle(
                                                    color: AppColors
                                                        .lightTextColor,
                                                    fontSize: 14)),
                                            Row(
                                              children: [
                                                Text(
                                                  '\$4500000',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                widthBox(5),
                                                Text(
                                                  '\$4500000',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors
                                                          .lightTextColor,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Container()
                                          ],
                                        ),
                                      ),
                                    ),
                                    popUpButton(),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'In stock (50)',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 0.4,
                  color: AppColors.appGreyColor.withOpacity(0.25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Color(0x0D242C44))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.share_rounded,
                            color: AppColors.appColor,
                            size: 15,
                          ),
                          widthBox(5),
                          Text(
                            'Share Product',
                            style: TextStyle(color: AppColors.appColor),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      child: Switch(
                        value: _con.isSwitched,
                        onChanged: (value) {
                          setState(() {
                            _con.isSwitched = value;
                          });
                        },
                        activeTrackColor: AppColors.appColor.withOpacity(0.4),
                        activeColor: AppColors.appColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );

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
