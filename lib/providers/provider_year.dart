import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class YearProvider extends ChangeNotifier {
  dynamic _year = "";
  dynamic get year => _year;

  Future fetchYears() async {
    final response = await http.get(Uri.parse(
        'https://apidigilist-production.up.railway.app/year/buscarTodos'));
    if (response.statusCode == 201) {
      _year = jsonDecode(response.body);
      notifyListeners();
    } else {
      throw Exception('Failed request');
    }
  }
}