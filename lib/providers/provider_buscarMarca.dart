import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BucarModeloPorMarca extends ChangeNotifier {
  // bool isLoading = true;
  String _marca = "";
  String get marca => _marca;

  set marca(String value) => _marca = value;

  dynamic _marcas = "";
  dynamic get marcas => _marcas;

  Future fetchBuscarMarca() async {
    final url = Uri.parse(
        'https://apidigilist-production.up.railway.app/modelo/buscarMarca/$_marca');

    try {
      final response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 201) {
        print(response.body);
        _marcas = jsonDecode(response.body);
        notifyListeners(); // Notificar cambios
      } else {
        throw Exception('Failed request');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
