import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Numbers with ChangeNotifier {
  static const arrayLength = 30;
  int count = 0;
  String? numberInput;
  String result =
      "Hey you, what trivia will you learn today? Enter a number to get started 😃";
  List<List<String>> historyResults = [];

  List<List<String>> get history {
    return [...historyResults];
  }

  Future<void> getNumber(String number) async {
    String dateTime = DateTime.now().toString();
    final url = Uri.http("numbersapi.com", "/$number");
    try {
      final response = await http.get(url);
      result =
          response.body.substring(number.length + 1); // Response returns text
      numberInput = number;
      count += 1;
      if (historyResults.length + 1 <= arrayLength) {
        historyResults.insert(0, [dateTime, number, result]);
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
