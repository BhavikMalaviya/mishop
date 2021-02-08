import 'package:flutter/material.dart';
import 'package:micatalogs/pages/Dashboard/category/add_edit_category_screen.dart';
import 'package:micatalogs/pages/Dashboard/category/product_list_screen.dart';
import 'package:micatalogs/pages/Dashboard/dashboard_screen.dart';
import 'package:micatalogs/pages/Dashboard/order/order_screen.dart';
import 'package:micatalogs/pages/Dashboard/profile/update_profile_screen.dart';
import 'package:micatalogs/pages/Dashboard/services/banners/add_banner_screen.dart';
import 'package:micatalogs/pages/Dashboard/services/banners/banner_list_screen.dart';
import 'package:micatalogs/pages/Dashboard/services/custom_domain_screen.dart';
import 'package:micatalogs/pages/Dashboard/services/payment/add_edit_payment_screen.dart';
import 'package:micatalogs/pages/Dashboard/services/payment/payment_list_screen.dart';
import 'package:micatalogs/pages/Dashboard/services/setting_screen.dart';
import 'package:micatalogs/pages/Dashboard/store_setup_screen.dart';
import 'package:micatalogs/pages/Dashboard/welcome_screen.dart';
import 'package:micatalogs/pages/auth/confirm_password_screen.dart';
import 'package:micatalogs/pages/auth/enter_otp_screen.dart';
import 'package:micatalogs/pages/auth/register_screen.dart';
import 'package:micatalogs/pages/business_details/add_edit_business_details.dart';
import 'package:micatalogs/pages/business_details/view_business_detail.dart';
import 'package:micatalogs/pages/product/add_edit_product_screen.dart';
import 'package:micatalogs/pages/product/add_edit_variants_screen.dart';
import 'package:micatalogs/pages/product/product_setting_screen.dart';
import 'package:micatalogs/pages/product/set_variants_screen.dart';
import 'package:micatalogs/pages/product/variants_list_screen.dart';
import 'package:micatalogs/pages/subscription/buy_premium_screen.dart';
import 'package:micatalogs/pages/subscription/current_subscription_screen.dart';
import 'helpers/variable_keys.dart';
import 'pages/auth/forgot_password_screen.dart';
import 'pages/auth/login_screen.dart';
import 'pages/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case RouteKeys.SPLASH:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RouteKeys.LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RouteKeys.SIGN_UP:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case RouteKeys.FORGOTPASSWORD:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case RouteKeys.ENTEROTPSCREEN:
        return MaterialPageRoute(builder: (_) => EnterOTPScreen());
      case RouteKeys.DASHBOARD:
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      case RouteKeys.WELCOME:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case RouteKeys.STORE_SETUP:
        return MaterialPageRoute(builder: (_) => StoreSetupScreen());
      case RouteKeys.BUYPREMIUM:
        return MaterialPageRoute(builder: (_) => BuyPremiumScreen());
      case RouteKeys.BUSINESSDETAIL:
        return MaterialPageRoute(builder: (_) => ViewBusinessDetails());
      case RouteKeys.ORDERDETAILS:
        return MaterialPageRoute(builder: (_) => OrderDetailScreen());
      case RouteKeys.ADDEDITCATEGORY:
        return MaterialPageRoute(builder: (_) => AddEditCategoryScreen());
      case RouteKeys.ADDEDITPRODUCT:
        return MaterialPageRoute(builder: (_) => AddEditProductScreen());
      case RouteKeys.SETVARIANTSCREEN:
        return MaterialPageRoute(builder: (_) => SetVariantsScreen());
      case RouteKeys.VARIANTSLISTSCREEN:
        return MaterialPageRoute(builder: (_) => VariantsListScreen());
      case RouteKeys.ADDEDITVARIANTS:
        return MaterialPageRoute(builder: (_) => AddEditVariantsScreen());
      case RouteKeys.CURRENTPLAN:
        return MaterialPageRoute(builder: (_) => CurrentSubscriptionScreen());
      case RouteKeys.PRODUCTSETTINGSCREEN:
        return MaterialPageRoute(builder: (_) => ProductSettingScreen());
      case RouteKeys.UPDATEPROFILE:
        return MaterialPageRoute(builder: (_) => UpdateProfileScreen());
      case RouteKeys.UPDATEPROFILE:
        return MaterialPageRoute(builder: (_) => UpdateProfileScreen());
      case RouteKeys.CUSTOMDOMAIN:
        return MaterialPageRoute(builder: (_) => CustomDomainScreen());
      case RouteKeys.SETTINGSCREEN:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      case RouteKeys.BANNERLISTSCREEN:
        return MaterialPageRoute(builder: (_) => BannerListScreen());
      case RouteKeys.ADDBANNERSCREEN:
        return MaterialPageRoute(builder: (_) => AddBannerScreen());
      case RouteKeys.CONFIRMPASSWORDSCREEN:
        return MaterialPageRoute(builder: (_) => ConfirmPasswordScreen());
      case RouteKeys.PAYMENTLISTSCREEN:
        return MaterialPageRoute(builder: (_) => PaymentListScreen());
      case RouteKeys.ADDEDITPAYMENTSCREEN:
        return MaterialPageRoute(builder: (_) => AddEditPaymentScreen());
      case RouteKeys.PRODUCTLISTSCREEN:
        return MaterialPageRoute(builder: (_) => CategoryWiseProducts());
      case RouteKeys.UPDATEBUSINESSDETAIL:
        return MaterialPageRoute(
          builder: (_) => AddEditBusinessDetailsScreen(),
        );
      // return MaterialPageRoute(
      //     builder: (_) =>
      //         LoginWithInputScreen(routeArgument: args as RouteArgument));
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: SafeArea(
              child: Center(
                child: Text('Route Error'),
              ),
            ),
          ),
        );
    }
  }
}
