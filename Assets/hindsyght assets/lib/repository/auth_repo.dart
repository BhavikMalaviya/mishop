import 'dart:convert';
import 'dart:io';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:device_info/device_info.dart';
import 'package:http/http.dart' as http;
import 'package:micatalogs/helpers/app_config.dart';
import 'package:micatalogs/helpers/variable_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  static Future<http.Response> loginUser(
      {String email, String password}) async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      String deviceId;
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.androidId;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor;
      }
      print(deviceId);
      return await http
          .post(
            '${AppData.apiBaseUrl}login',
            body: {
              'email': email,
              'password': password,
              'type': "mobile",
            },
          )
          .catchError((e) => null)
          .timeout(Duration(seconds: 8), onTimeout: () => null);
    } else {
      return http.Response(jsonEncode(AppData.noInternetJson), 503);
    }
  }

  static Future<http.Response> registerUser(
      {String email,
      String password,
      String fullName,
      String phoneNo,
      String country}) async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      return await http
          .post(
            '${AppData.apiBaseUrl}register',
            body: {
              "email": email,
              "password": password,
              "full_name": fullName,
              "contact_no": phoneNo,
              "country": country,
            },
          )
          .catchError((e) => null)
          .timeout(Duration(seconds: 8), onTimeout: () => null);
    } else {
      return http.Response(jsonEncode(AppData.noInternetJson), 503);
    }
  }

  static Future<http.Response> otpVerification(
      {String email, String otp}) async {
    return await http
        .post(
          '${AppData.apiBaseUrl}otp/verify',
          body: {'email': email, 'otp': otp},
        )
        .catchError((e) => null)
        .timeout(Duration(seconds: 8), onTimeout: () => null);
  }

  static Future<http.Response> resetPassword(
      {String email, String otp, String password}) async {
    return await http
        .post(
          '${AppData.apiBaseUrl}reset/password',
          body: {'email': email, 'otp': otp, 'password': password},
        )
        .catchError((e) => null)
        .timeout(Duration(seconds: 8), onTimeout: () => null);
  }

  static Future<http.Response> availableStoreApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(PrefsKey.ACCESS_TOKEN);
    print(token);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      return await http
          .get('${AppData.apiBaseUrl}business/detail',
              headers: {"Authorization": token})
          .catchError((e) => null)
          .timeout(Duration(seconds: 8), onTimeout: () => null);
    } else {
      return http.Response(jsonEncode(AppData.noInternetJson), 503);
    }
  }

  static Future<http.Response> getCountryApi() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      return await http
          .get(
            '${AppData.apiBaseUrl}country',
          )
          .catchError((e) => null)
          .timeout(Duration(seconds: 8), onTimeout: () => null);
    } else {
      return http.Response(jsonEncode(AppData.noInternetJson), 503);
    }
  }

  static Future<http.Response> sendEmailForgotPass({
    String email,
  }) async {
    return await http
        .post(
          '${AppData.apiBaseUrl}forgot/password',
          body: {
            'email': email,
          },
        )
        .catchError((e) => null)
        .timeout(Duration(seconds: 8), onTimeout: () => null);
  }
}
