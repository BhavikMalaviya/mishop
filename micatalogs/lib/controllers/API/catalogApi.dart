import 'package:http/http.dart' as http;
import 'dart:convert';

class CatalogApi {
  static Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZmQ4NTMxZTU4Yjc3YzFlZGM2MzliMjAiLCJyb2xlX2lkIjoiNWZkODUzMWU1OGI3N2MxZWRjNjM5YjI0IiwiaWF0IjoxNjEyMTc2NTEyfQ.2RmnkFL3i_kgvTrfWebTOVM3IqYJggDFWTztnY5oTDU'
  };

  static Future<List<dynamic>> getCatalogs() async {
    http
        .get("http://api.aeonarc.in/api/v1/category?page=1",
            headers: requestHeaders)
        .then((value) {
      var res = json.decode(value.body);
      List<dynamic> catalogs = res['data']['data'][0];
      print(catalogs);
      return catalogs;
    });
  }
}
