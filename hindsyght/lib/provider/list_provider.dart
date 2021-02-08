import 'package:flutter/material.dart';
import 'package:hindsyght/Modal/items.dart';

class ListDetail extends ChangeNotifier {
  Items item =
      Items(company_name: "IT ", id: 1, image_link: 'assets/images/google.png');
  Items get items => item;
  Items getItems() {
    return item;
  }
}
