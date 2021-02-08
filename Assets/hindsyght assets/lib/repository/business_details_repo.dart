import 'dart:convert';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:micatalogs/helpers/app_config.dart';
import 'package:micatalogs/helpers/variable_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusinessDetailsRepo {
  static Future<http.Response> getStoreDetailsApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(PrefsKey.ACCESS_TOKEN);
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

  static Future<http.Response> getStateApi({String countryId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(PrefsKey.ACCESS_TOKEN);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      return await http
          .get('${AppData.apiBaseUrl}state/$countryId',
              headers: {"Authorization": token})
          .catchError((e) => null)
          .timeout(Duration(seconds: 8), onTimeout: () => null);
    } else {
      return http.Response(jsonEncode(AppData.noInternetJson), 503);
    }
  }

  static Future<http.Response> getCityApi({String stateId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(PrefsKey.ACCESS_TOKEN);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      return await http
          .get('${AppData.apiBaseUrl}city/$stateId',
              headers: {"Authorization": token})
          .catchError((e) => null)
          .timeout(Duration(seconds: 8), onTimeout: () => null);
    } else {
      return http.Response(jsonEncode(AppData.noInternetJson), 503);
    }
  }

  static Future<http.Response> getCurrencyApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(PrefsKey.ACCESS_TOKEN);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      return await http
          .get('${AppData.apiBaseUrl}currency',
              headers: {"Authorization": token})
          .catchError((e) => null)
          .timeout(Duration(seconds: 8), onTimeout: () => null);
    } else {
      return http.Response(jsonEncode(AppData.noInternetJson), 503);
    }
  }

  static Future<Response> createBusinessDetailsApi({
    String email,
    String businessName,
    String tagLine,
    String mobile,
    String address,
    String pincode,
    MultipartFile image,
    String currencyId,
    String countryId,
    String stateId,
    String cityId,
    String langCode,
    String domainName,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(PrefsKey.ACCESS_TOKEN);
    var uri = Uri.parse('${AppData.apiBaseUrl}business/detail');
    Response response = await Dio()
        .post('$uri',
            options: Options(headers: {'Authorization': token}),
            data: FormData.fromMap({
              "email": email,
              "address": address,
              "currency": currencyId,
              "tagline": tagLine,
              "business_name": businessName,
              "phone_number": mobile,
              "subdomain": domainName,
              "store_type": "ecommerce",
              // "domain": "",
              "pincode": pincode,
              "city": cityId,
              "state": stateId,
              "country": countryId,
              "default_language": langCode,
              "type": "mobile",
            }))
        .catchError((e) {
      return null;
    });
    return response;
  }

  static Future<Response> updateBusinessDetailsApi({
    String email,
    String businessName,
    String tagLine,
    String mobile,
    String address,
    String pincode,
    MultipartFile image,
    String currencyId,
    String countryId,
    String stateId,
    String cityId,
    String langCode,
    String domainName,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(PrefsKey.ACCESS_TOKEN);
    var uri = Uri.parse('${AppData.apiBaseUrl}business/detail');
    Response response = await Dio()
        .put('$uri',
            options: Options(headers: {'Authorization': token}),
            data: FormData.fromMap({
              "email": email,
              "address": address,
              "currency": currencyId,
              "tagline": tagLine,
              "business_name": businessName,
              "phone_number": mobile,
              "subdomain": domainName,
              "store_type": "ecommerce",
              // "domain": "",
              "pincode": pincode,
              "city": cityId,
              "state": stateId,
              "country": countryId,
              "default_language": langCode,
              "type": "mobile",
            }))
        .catchError((e) {
      return null;
    });
    return response;
  }
}
