import 'package:flutter/material.dart';
import 'package:micatalogs/controllers/category/category_product_controller.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/helpers/variable_keys.dart';
import 'package:micatalogs/pages/Dashboard/category/category_action_dialog.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class CategoryProductListScreen extends StatefulWidget {
  final Function onTap;
  CategoryProductListScreen({this.onTap});
  @override
  _CategoryProductListScreenState createState() =>
      _CategoryProductListScreenState();
}

class _CategoryProductListScreenState
    extends StateMVC<CategoryProductListScreen>
    with SingleTickerProviderStateMixin {
  CategoryProductController _con;
  _CategoryProductListScreenState() : super(CategoryProductController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: _con.currentTabIndex,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.dehaze),
            onPressed: widget.onTap,
            color: AppColors.whiteTextColor,
          ),
          backgroundColor: AppColors.appColor,
          title: Text(
            "My Store",
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            onTap: (index) {
              setState(() {
                _con.currentTabIndex = index;
              });
            },
            indicatorColor: AppColors.whiteTextColor,
            tabs: [
              Tab(
                child: Text(
                  'Category',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Products',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          actions: [
            Container(
              margin: EdgeInsets.all(20),
              child: Icon(
                Icons.search_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
        floatingActionButton: _con.currentTabIndex == 0
            ? categoryFoatingButton()
            : productFoatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            _buildCategoryList(
              key: "category",
            ),
            _buildProductList(
              key: "products",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryList({String key}) {
    return Container(
      // padding: EdgeInsets.only(top: 12),
      child: ListView.builder(
        itemCount: 51,
        key: PageStorageKey(key),
        itemBuilder: (_, index) => categoryCard(index: index),
      ),
    );
  }

  Widget _buildProductList({String key}) {
    return Container(
      // padding: EdgeInsets.only(top: 12),
      child: ListView.builder(
        itemCount: 51,
        key: PageStorageKey(key),
        itemBuilder: (_, index) => productCard(index: index),
      ),
    );
  }

  categoryCard({int index}) => Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, RouteKeys.PRODUCTLISTSCREEN),
          child: Card(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        child: Image.network(
                          'https://picsum.photos/id/${index + 10}/200/300',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
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
                                          'Category title $index',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text('50 views',
                                            style: TextStyle(
                                                color: AppColors.lightTextColor,
                                                fontSize: 14)),
                                        Text('500 products listed',
                                            style: TextStyle(
                                                color: AppColors.lightTextColor,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => showBottomSheet(),
                                  child: Icon(
                                    Icons.more_vert_rounded,
                                    color: AppColors.appGreyColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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
                              'Share Category',
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
        ),
      );

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
                                    // GestureDetector(
                                    //   onTap: () => showBottomSheet(),
                                    //   child: Icon(
                                    //     Icons.more_vert_rounded,
                                    //     color: AppColors.appGreyColor,
                                    //   ),
                                    // ),
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

  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: CategoryActionDialog(),
          ),
        );
      },
    );
  }

  productFoatingButton() => Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 100),
        child: MaterialButton(
          padding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          color: AppColors.appColor,
          onPressed: () =>
              Navigator.pushNamed(context, RouteKeys.ADDEDITPRODUCT),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add Product',
                  style: TextStyle(
                    color: AppColors.whiteTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  categoryFoatingButton() => Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 100),
        child: MaterialButton(
          padding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          color: AppColors.appColor,
          onPressed: () =>
              Navigator.pushNamed(context, RouteKeys.ADDEDITCATEGORY),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add Category',
                  style: TextStyle(color: AppColors.whiteTextColor),
                ),
              ],
            ),
          ),
        ),
      );
}
