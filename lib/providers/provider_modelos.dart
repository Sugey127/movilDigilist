import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ModeloProvider extends ChangeNotifier {
  // bool isLoading = true;
  dynamic _modelos = "";
  dynamic get modelos => _modelos;

  Future fetchModelos() async {
    final response = await http.get(Uri.parse(
        'https://apidigilist-production.up.railway.app/modelo/buscarTodos'));

    if (response.statusCode == 201) {
      print(response.body);
      _modelos = jsonDecode(response.body);
      notifyListeners(); // Notificar cambios
    } else {
      throw Exception('Failed request');
    }
  }
}
