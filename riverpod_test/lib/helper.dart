import 'package:flutter/cupertino.dart';

class Helper extends ChangeNotifier {
  int _value = 0;
  int get value => _value;
  void increament() {
    _value++;

    notifyListeners();
  }

  void decreament() {
    _value--;
    notifyListeners();
  }
}
