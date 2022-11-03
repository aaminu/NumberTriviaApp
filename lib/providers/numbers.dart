import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Numbers with ChangeNotifier {
  String? result;
  List<String> historyResults = [];

  List<String> get history {
    return [...historyResults];
  }

  Future<void> getNumber(String number) async {
    final url = Uri.http("numbersapi.com", "/$number");
    try {
      final response = await http.get(url);
      final result = response.body; // Response returns text
      print(result);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
