import 'package:micatalogs/controllers/base_controller.dart';

class VariantsListController extends BaseController {
  String title;
  String description;
  String variants;

  List varientsList = [
    {"option": "Color", "type": "Select"},
    {"option": "Size", "type": "Text Area"},
    {"option": "Kilogram", "type": "Checkbox"}
  ];
}
