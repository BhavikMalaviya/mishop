import 'package:flutter/material.dart';
import 'package:micatalogs/controllers/base_controller.dart';

class AddEditVariantsController extends BaseController {
  String title;
  String description;
  String variants;
  List<Widget> valuesList = [];
  // List<String> values = [];
  List<TextEditingController> controllers = <TextEditingController>[];
  int fieldCount = 0;
  List<String> variantType = [
    "Text",
    "Text Area",
    "Selection Box",
    "Check Box",
    "Radio Button",
  ];
}
