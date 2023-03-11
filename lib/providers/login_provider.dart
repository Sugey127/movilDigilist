import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class loginProvider extends ChangeNotifier {
  // bool isLoading = true;
  dynamic _usuario = "";
  dynamic get usuario => _usuario;

  String _email = '';
  String get email => _email;

  String _pass = '';
  String get pass => _pass;

  Future fetchLogin(String email, String password) async {
    _email = email;
    _pass = password
    final response = await http.post(
        Uri.parse(
            'https://apidigilist-production.up.railway.app/usuario/login'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{"email": email, "password": password}));
    print(response.body);
    if (response.statusCode == 200) {
      final preferences = await SharedPreferences.getInstance();
      preferences.setString('token', jsonDecode(response.body)[0]);
      print(response.body);
      _usuario = jsonDecode(response.body);
      notifyListeners(); // Notificar cambios
    } else {
      throw Exception('Failed request');
    }
  }
}
