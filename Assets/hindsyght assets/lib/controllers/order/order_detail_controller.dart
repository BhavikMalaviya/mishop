import 'package:flutter/material.dart';
import 'package:micatalogs/controllers/base_controller.dart';

class OrderDetailsController extends BaseController {
  TextStyle titleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  List color = [
    Colors.orange,
    Colors.teal,
    Colors.green,
  ];

  List size = [
    "1",
    "2",
  ];

  List orderList = [
    {
      "name": "Order name 1",
      "price": 40,
    },
    {
      "name": "Order name 2",
      "price": 30,
    },
  ];
}
