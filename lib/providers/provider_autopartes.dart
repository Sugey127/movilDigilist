import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AutoparteProvider extends ChangeNotifier {
  // bool isLoading = true;
  dynamic _autopartes = "";
  dynamic get autopartes => _autopartes;

  Future fetchAutopartes() async {
    final response = await http.get(Uri.parse(
        'https://digilist.fly.dev/autopartes/buscarTodos'));

    if (response.statusCode == 201) {
      print(response.body);
      _autopartes = jsonDecode(response.body);
      notifyListeners(); // Notificar cambios
    } else {
      throw Exception('Failed request');
    }
  }
}
