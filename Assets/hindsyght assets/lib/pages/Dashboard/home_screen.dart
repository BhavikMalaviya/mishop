import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:micatalogs/helpers/global.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/packages/size_config.dart';
import 'package:micatalogs/controllers/dashboard/home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  final Function ontap;
  HomeScreen({this.ontap});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends StateMVC<HomeScreen> {
  HomeScreenController _con;
  _HomeScreenState() : super(HomeScreenController()) {
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
          onPressed: widget.ontap,
          color: AppColors.whiteTextColor,
        ),
        title: Text(
          'Dashboard',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Sales : ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.lightTextColor,
                              ),
                            ),
                            Text(
                              '\u20B9 20,000',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      popUpButton(),
                    ],
                  ),
                  heightBox(20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: AppColors.extraLightAppColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/svg/order.svg',
                                    height: 25,
                                    color: AppColors.appColor,
                                  ),
                                ),
                              ),
                              heightBox(10),
                              Text(
                                'Total Orders',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.appGreyColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '6',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      widthBox(15),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: AppColors.extraLightAppColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.store_rounded,
                                    size: 30,
                                    color: AppColors.appColor,
                                  ),
                                ),
                              ),
                              heightBox(10),
                              Text(
                                'Store Visitors',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.appGreyColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '43',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  heightBox(15),
                  Container(
                    padding: EdgeInsets.all(15),
                    width: SizeConfig.safeBlockHorizontal * 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Get sharable link',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.lightTextColor,
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.appColor,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/svg/link.svg',
                                  height: 15,
                                  color: AppColors.whiteTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        heightBox(10),
                        Text(
                          "Share your own web store's link on social media to attract more customers only",
                          style: TextStyle(color: AppColors.appGreyColor),
                        ),
                        heightBox(10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          height: 50,
                          child: Row(
                            children: [
                              widthBox(10),
                              SvgPicture.asset(
                                'assets/svg/link.svg',
                                height: 20,
                                color: AppColors.lightTextColor,
                              ),
                              widthBox(10),
                              Container(
                                height: 50,
                                width: 0.3,
                                color: AppColors.appColor,
                              ),
                              widthBox(10),
                              Expanded(
                                child: Text(
                                  'https://demo.mi-catalog.com/',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.lightTextColor,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                width: 60,
                                decoration: BoxDecoration(
                                  color: AppColors.appColor,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/svg/share.svg',
                                    height: 20,
                                    color: AppColors.whiteTextColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: SizeConfig.safeBlockHorizontal * 100,
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Text(
                'Top Viewing Products',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.lightTextColor,
                ),
              ),
            ),
            Container(
              height: 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _con.productsList
                      .map(
                        (val) => Row(
                          children: [
                            widthBox(15),
                            Container(
                              width: 150,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5, color: Colors.black12),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Image(
                                      width:
                                          SizeConfig.safeBlockHorizontal * 40,
                                      image: NetworkImage(
                                        val['image'],
                                      ),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  heightBox(5),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Text(
                                      val['name'],
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Text(
                                      val['view'] + ' Views',
                                      style: TextStyle(
                                        color: AppColors.lightTextColor,
                                      ),
                                    ),
                                  ),
                                  heightBox(10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget popUpButton() => PopupMenuButton<String>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'Last 7 Days',
            child: Text(
              "Last 7 Days",
            ),
          ),
          PopupMenuItem(
            value: 'Last 14 Days',
            child: Text(
              "Last 14 Days",
            ),
          ),
          PopupMenuItem(
            value: 'Last Month',
            child: Text(
              "Last Month",
            ),
          ),
          PopupMenuItem(
            value: 'All',
            child: Text(
              "All",
            ),
          ),
        ],
        onSelected: (val) => setState(() => _con.filterString = val),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          width: 120,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(
            children: [
              widthBox(10),
              Text(
                _con.filterString,
                style: TextStyle(
                  color: AppColors.appColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_drop_down,
                color: AppColors.appColor,
              ),
              widthBox(10),
            ],
          ),
        ),
      );
}
