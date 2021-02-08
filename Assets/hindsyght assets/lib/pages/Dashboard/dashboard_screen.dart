import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:micatalogs/helpers/app_colors.dart';
import 'package:micatalogs/pages/drawer_screen.dart';
import 'package:micatalogs/pages/Dashboard/home_screen.dart';
import 'package:micatalogs/pages/Dashboard/profile/profile_screen.dart';
import 'package:micatalogs/pages/Dashboard/services/services_screen.dart';
import 'package:micatalogs/pages/Dashboard/order/order_list_screeen.dart';
import 'package:micatalogs/pages/Dashboard/category/category_product_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int index = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: index,
        onTap: (ind) => setState(() => index = ind),
        selectedItemColor: AppColors.appColor,
        unselectedItemColor: AppColors.lightTextColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/home.svg',
              height: 25,
              width: 25,
              color: index == 0 ? AppColors.appColor : AppColors.lightTextColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/order.svg',
              height: 25,
              width: 25,
              color: index == 1 ? AppColors.appColor : AppColors.lightTextColor,
            ),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/product.svg',
              height: 25,
              width: 25,
              color: index == 2 ? AppColors.appColor : AppColors.lightTextColor,
            ),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/services.svg',
              height: 25,
              width: 25,
              color: index == 3 ? AppColors.appColor : AppColors.lightTextColor,
            ),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/profile.svg',
              height: 25,
              width: 25,
              color: index == 4 ? AppColors.appColor : AppColors.lightTextColor,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: screenWidgets(index),
    );
  }

  Widget screenWidgets(index) {
    switch (index) {
      case 0:
        return HomeScreen(
          ontap: () {
            _scaffoldKey.currentState.openDrawer();
          },
        );
        break;
      case 1:
        return OrderListScreen(
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
        );
        break;
      case 2:
        return CategoryProductListScreen(
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
        );
        break;
      case 3:
        return ServicesScreen(
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
        );
        break;
      case 4:
        return ProfileScreen(
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
        );
        break;
      default:
        return HomeScreen(
          ontap: () {
            _scaffoldKey.currentState.openDrawer();
          },
        );
        break;
    }
  }
}
