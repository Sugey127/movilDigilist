import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/Inici.dart';

class loginProvider extends ChangeNotifier {
  // bool isLoading = true;
  dynamic _usuario = "";
  dynamic get usuario => _usuario;

  String _email = '';
  String get email => _email;

  String _pass = '';
  String get pass => _pass;

  String _nombre = '';
  String get nombre => _nombre;

  String _apellido = '';
  String get apellido => _apellido;

  String _telefono= '';
  String get telefono=> _telefono;


  set pass(String value) => _pass = value;
  set email(String value) => _email = value;

  Future fetchLogin(String email, String password, BuildContext context) async {
    // print('aaaaaaaaaaaaaaaaaaaaaaa: ' + email);
    // print('aaaaaaaaaaaaaaaaaaaa3333333333333333: ' + password);
    _email = email;
    _pass = password;
    final response = await http.post(
        Uri.parse(
            'https://digilist.fly.dev/usuario/login'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body:
            jsonEncode(<String, String>{"email": email, "password": password}));
    print('este es el codigo de estado ${response.statusCode}');
    if (response.statusCode == 200) {
      final preferences = await SharedPreferences.getInstance();
      preferences.setString('token', jsonDecode(response.body)[0]);
      _usuario = jsonDecode(response.body)[1];
      // ❤❤❤❤❤❤❤❤❤❤❤
      _nombre = _usuario['userNombre'];
      _apellido = _usuario['usuarioApellido'];
      _telefono = _usuario['telefono'];
      
      

      notifyListeners(); // Notificar cambios
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Inicio_page()));
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Correo y/o contraseña incorrectos'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
