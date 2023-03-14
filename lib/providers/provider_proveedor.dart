import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProveedorProvider extends ChangeNotifier {
  dynamic _proveedores = "";
  dynamic get proveedores => _proveedores;

  Future fetchProveedores() async {
    final response = await http.get(Uri.parse(
        'https://apidigilist-production.up.railway.app/proveedores/buscarTodos'));

    if (response.statusCode == 201) {
      _proveedores = jsonDecode(response.body);
      notifyListeners();
    } else {
      throw Exception('Failed request');
    }
  }
}