import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Numbers with ChangeNotifier {
  String result =
      "Hey you, what trivia will you learn today? Enter a number to get started 😃";
  String? numberInput;
  int count = 0;
  List<String> historyResults = [];

  List<String> get history {
    return [...historyResults];
  }

  Future<void> getNumber(String number) async {
    final url = Uri.http("numbersapi.com", "/$number");
    try {
      final response = await http.get(url);
      result = response.body.substring(number.length); // Response returns text
      numberInput = number;
      count += 1;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
