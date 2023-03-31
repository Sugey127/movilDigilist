import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CarritoProvider extends ChangeNotifier {
  dynamic _carrito = "";
  dynamic get carrito => _carrito;

  Future fetchCarrito() async {
    final response = await http.get(Uri.parse(
        'https://digilist.fly.dev/carrito/listarCarrito'));

    if (response.statusCode == 201) {
      _carrito = jsonDecode(response.body);
      notifyListeners();
    } else {
      throw Exception('Failed request');
    }
  }
}