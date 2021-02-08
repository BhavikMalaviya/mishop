import 'package:mvc_pattern/mvc_pattern.dart';

class BuyPremiumController extends ControllerMVC {
  int current = 2;
  
  List currentList = [
    "Products : 50",
    "Catalogs : 5",
    "Branding",
    "Premium Support",
    "Personalize Website",
    "Product Sizing and Color",
    "Web Admin Access",
    "Sub Domain",
  ];

  onChanged(number, context) {
    setState(() {
      current = number;
    });
  }

  onBuyPremium() {}
}
