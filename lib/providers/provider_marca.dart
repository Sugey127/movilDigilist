import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MarcaProvider extends ChangeNotifier {
  dynamic _marcas = "";
  dynamic get marcas => _marcas;

  Future fetchMarcas() async {
    final response = await http.get(Uri.parse(
        'https://digilist.fly.dev/marca/buscarTodos'));

    if (response.statusCode == 201) {
      _marcas = jsonDecode(response.body);
      notifyListeners();
    } else {
      throw Exception('Failed request');
    }
  }
}
