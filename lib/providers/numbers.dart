import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Numbers with ChangeNotifier {
  static const arrayLength = 20;
  int count = 0;
  String? numberInput;
  String result =
      "Hey you, what trivia will you learn today? Enter a number to get started 😃";
  final List<List<String>> _historyResults = [];

  List<List<String>> get history {
    return [..._historyResults];
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
      //Add to history but limit to 20 search history
      if (_historyResults.length + 1 <= arrayLength) {
        _historyResults.insert(0, [dateTime, number, result]);
      } else {
        _historyResults.removeLast();
        _historyResults.insert(0, [dateTime, number, result]);
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
