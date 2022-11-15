import 'package:flutter/material.dart';

class Settings with ChangeNotifier {
  Color colorValue = Color.fromARGB(255, 12, 102, 176);

  void changeColor(Color color) {
    colorValue = color;
    notifyListeners();
  }
}
