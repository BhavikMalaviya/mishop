import 'package:flutter/material.dart';

class Items extends ChangeNotifier {
  List note = [];
  void onSubmit(String text) {
    note.add(text);
    notifyListeners();
  }

  void remove(int index) {
    note.removeAt(index);
    notifyListeners();
  }
}
