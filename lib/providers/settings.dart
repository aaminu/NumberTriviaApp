import 'package:flutter/material.dart';

class Settings with ChangeNotifier {
  Color colorValue = Color.fromARGB(255, 12, 102, 176);
  int historyCount = 20;

  void changeColor(Color color) {
    colorValue = color;
    notifyListeners();
  }

  void changeHistoryCount(int? count) {
    if (count != null) {
      historyCount = count;
      notifyListeners();
    }
  }
}
