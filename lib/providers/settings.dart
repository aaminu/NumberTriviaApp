import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  Color colorValue = Color(0xFF0C66B0);
  int historyCount = 20;

  void changeColor(Color color) async {
    colorValue = color;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('color', color.value);
  }

  void changeHistoryCount(int? count) async {
    if (count != null) {
      historyCount = count;
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('count', count);
    }
  }

  Future<void> getHistoryCount() async {
    final prefs = await SharedPreferences.getInstance();
    historyCount = prefs.getInt('count') ?? 20;
  }

  Future<void> getColorInt() async {
    final prefs = await SharedPreferences.getInstance();
    final colorValueInt = prefs.getInt('color') ?? 0xFF0C66B0;
    colorValue = Color(colorValueInt);
  }
}
