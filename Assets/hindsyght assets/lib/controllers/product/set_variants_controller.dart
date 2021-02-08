import 'package:micatalogs/controllers/base_controller.dart';

class SetVariantsController extends BaseController {
  String title;
  String description;
  String variants;

  List<String> varientsList = ["Color", "Size", "Kilogram"];
  bool isPlus = true;
  bool isPlusPrice = true;
  List colorList = [
    "Red",
  ];

  onPricePercentageTap() {
    setState(() => isPlusPrice = !isPlusPrice);
  }

  onPlusMinusTap() {
    setState(() => isPlus = !isPlus);
  }
}
