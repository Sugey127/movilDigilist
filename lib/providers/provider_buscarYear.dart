import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BucarModeloPorYear extends ChangeNotifier {
  String _year = "";
  String get year => _year;

  set year(String value) => _year = value;

  dynamic _years = "";
  dynamic get years => _years;

  Future fetchBuscaryear() async {
    final url = Uri.parse(
        'https://digilist.fly.dev/modelo/buscarYear/$_year');

    try {
      final response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 201) {
        print(response.body);
        _years = jsonDecode(response.body);
        notifyListeners(); // Notificar cambios
      } else {
        throw Exception('Failed request');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
