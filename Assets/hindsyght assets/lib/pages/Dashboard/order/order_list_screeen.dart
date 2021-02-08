import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:micatalogs/controllers/order/order_list_controller.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:micatalogs/helpers/variable_keys.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class OrderListScreen extends StatefulWidget {
  final Function onTap;
  OrderListScreen({this.onTap});

  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends StateMVC<OrderListScreen> {
  OrderListController _con;
  _OrderListScreenState() : super(OrderListController()) {
    _con = controller;
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appColor,
        leading: IconButton(
          icon: Icon(Icons.dehaze),
          onPressed: widget.onTap,
          color: AppColors.whiteTextColor,
        ),
        title: Text(
          'Orders',
          style: TextStyle(
            color: AppColors.whiteTextColor,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            color: AppColors.whiteTextColor,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black12.withOpacity(0.07),
                    ),
                    child: Row(
                      children: [
                        widthBox(10),
                        Icon(Icons.search),
                        widthBox(10),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search Order",
                            ),
                          ),
                        ),
                        widthBox(10),
                      ],
                    ),
                  ),
                ),
                widthBox(10),
                filter1Button(),
                widthBox(10),
                filter2Button(),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, index) => GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, RouteKeys.ORDERDETAILS),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(
                      left: 15,
                      right: 15,
                      bottom: 15,
                      top: index == 0 ? 15 : 0),
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Order : #26767',
                                      style: TextStyle(
                                        color: AppColors.lightTextColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.appColor,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 10,
                                          color: AppColors.whiteTextColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text('1 Item'),
                                Text(
                                  '\u20B9 400',
                                  style: TextStyle(
                                    color: AppColors.appColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      heightBox(8),
                      Row(
                        children: [
                          Container(
                            width: 80,
                            decoration: BoxDecoration(
                              color: AppColors.appColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Center(
                              child: Text(
                                'Accepted',
                                style: TextStyle(
                                  color: AppColors.appColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Dec 5 2020',
                            style: TextStyle(
                                fontSize: 12, color: AppColors.lightTextColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget filter1Button() => PopupMenuButton<String>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'All',
            child: Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.cyan,
                  ),
                ),
                widthBox(10),
                Text(
                  "All",
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'Pending',
            child: Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                ),
                widthBox(10),
                Text(
                  "Pending",
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'Accepted',
            child: Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.appColor,
                  ),
                ),
                widthBox(10),
                Text(
                  "Accepted",
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'In Process',
            child: Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
                widthBox(10),
                Text(
                  "In Process",
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'Cancelled',
            child: Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
                widthBox(10),
                Text(
                  "Cancelled",
                ),
              ],
            ),
          ),
        ],
        onSelected: (val) {},
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                color: Colors.black12,
              )
            ],
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/svg/filter2.svg',
              height: 20,
              color: AppColors.appColor,
            ),
          ),
        ),
      );

  Widget filter2Button() => PopupMenuButton<String>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'All Days',
            child: Text(
              "All Days",
            ),
          ),
          PopupMenuItem(
            value: 'Today',
            child: Text(
              "Today",
            ),
          ),
          PopupMenuItem(
            value: 'Yesterday',
            child: Text(
              "Yesterday",
            ),
          ),
          PopupMenuItem(
            value: 'Last 7 Days',
            child: Text(
              "Last 7 Days",
            ),
          ),
          PopupMenuItem(
            value: 'Last 30 Days',
            child: Text(
              "Last 30 Days",
            ),
          ),
          PopupMenuItem(
            value: 'Last month',
            child: Text(
              "Last month",
            ),
          ),
        ],
        onSelected: (val) {},
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                color: Colors.black12,
              )
            ],
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/svg/filter.svg',
              height: 20,
              width: 25,
              color: AppColors.appColor,
            ),
          ),
        ),
      );
}
