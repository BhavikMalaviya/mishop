import 'package:flutter/material.dart';
import 'package:micatalogs/controllers/order/order_detail_controller.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class OrderDetailScreen extends StatefulWidget {
  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends StateMVC<OrderDetailScreen> {
  OrderDetailsController _con;
  _OrderDetailScreenState() : super(OrderDetailsController()) {
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
          'Orders',
          style: TextStyle(
            color: AppColors.whiteTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 4.0,
                        color: AppColors.appColor,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  widthBox(10),
                  Text(
                    "Accepted on Dec 29 2020",
                    style: _con.titleStyle,
                  ),
                ],
              ),
              heightBox(20),
              Container(
                width: SizeConfig.safeBlockHorizontal * 100,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.appColor, width: 0.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _con.orderList
                      .asMap()
                      .map(
                        (index, value) => MapEntry(
                          index,
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 15,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      height: SizeConfig.safeBlockVertical * 15,
                                      width: SizeConfig.safeBlockVertical * 15,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: AppColors.extraLightAppColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5.0,
                                          )
                                        ],
                                      ),
                                    ),
                                    widthBox(10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Order Name",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          heightBox(
                                                  SizeConfig.safeBlockVertical *
                                                      0.4,),
                                          Text(
                                            "\$ 6.00",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          heightBox(
                                                  SizeConfig.safeBlockVertical *
                                                      0.5,),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "Size:",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              widthBox(10),
                                              Expanded(
                                                child: Wrap(
                                                  runSpacing: 5.0,
                                                  spacing: 5.0,
                                                  children: _con.size
                                                      .asMap()
                                                      .map(
                                                        (index, value) =>
                                                            MapEntry(
                                                          index,
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        2),
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                      width:
                                                                          0.5),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          3),
                                                            ),
                                                            child: Text(
                                                              "$value",
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                      .values
                                                      .toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          heightBox(10),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "Color:",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              widthBox(10),
                                              Expanded(
                                                child: Wrap(
                                                  runSpacing: 5.0,
                                                  spacing: 5.0,
                                                  children: _con.color
                                                      .asMap()
                                                      .map(
                                                        (index, value) =>
                                                            MapEntry(
                                                          index,
                                                          Container(
                                                            height: 25,
                                                            width: 25,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                      width:
                                                                          0.5),
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: value,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                      .values
                                                      .toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              index + 1 != _con.orderList.length
                                  ? Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Container(
                                        height: 0.8,
                                        color: AppColors.appColor,
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      )
                      .values
                      .toList(),
                ),
              ),
              heightBox(15),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(blurRadius: 5.0, color: Colors.black12)
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Item Total",
                          style: _con.titleStyle,
                        ),
                        Spacer(),
                        Text(
                          "\$ 12.00",
                          style: _con.titleStyle,
                        ),
                      ],
                    ),
                    heightBox(10),
                    Row(
                      children: <Widget>[
                        Text(
                          "Delivery Fees",
                          style: _con.titleStyle,
                        ),
                        Spacer(),
                        Text(
                          "\$ 12.00",
                          style: _con.titleStyle,
                        ),
                      ],
                    ),
                    heightBox(15),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.extraLightAppColor),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Grand Total",
                            style: _con.titleStyle,
                          ),
                          Spacer(),
                          Text(
                            "\$ 20.00",
                            style: _con.titleStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              heightBox(15),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Customer Detail",
                        style: _con.titleStyle,
                      ),
                      heightBox(15),
                      Container(height: 2, color: AppColors.appColor),
                      heightBox(15),
                      detailTile(title: "Name:", text: "Customer Name"),
                      heightBox(10),
                      detailTile(title: "Mobile:", text: "+91 00011 11000"),
                      heightBox(10),
                      detailTile(
                        title: "Address:",
                        text: "3246 Willow oacks Lane, Missouri.",
                      ),
                      heightBox(10),
                      detailTile(title: "City:", text: "Missouri"),
                      heightBox(10),
                      detailTile(title: "Pin code:", text: "302040"),
                      heightBox(10),
                      detailTile(title: "Payment:", text: "Cash on delivery"),
                    ],
                  ),
                ),
              ),
              heightBox(15),
              Row(
                children: <Widget>[
                  Container(
                    height: SizeConfig.safeBlockVertical * 6,
                    width: SizeConfig.safeBlockHorizontal * 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          SizeConfig.safeBlockVertical * 4),
                      color: AppColors.appColor,
                    ),
                    child: Center(
                      child: Text(
                        "Ship Order",
                        style: TextStyle(
                            color: AppColors.whiteTextColor, fontSize: 16.0),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: SizeConfig.safeBlockVertical * 6,
                    width: SizeConfig.safeBlockHorizontal * 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          SizeConfig.safeBlockVertical * 4),
                      border: Border.all(color: AppColors.appColor),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        "Cancel Order",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: AppColors.appColor,
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
    );
  }

  Widget detailTile({String title, String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: SizeConfig.safeBlockHorizontal * 35,
          child: Text(
            "$title",
            style: _con.titleStyle,
          ),
        ),
        widthBox(10),
        Expanded(
          child: Text(
            "$text",
            style: TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }
}
