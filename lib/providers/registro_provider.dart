import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/providers/provider_verificarCode.dart';
import 'package:flutter_login_ui/screens/verificarCode.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/Inici.dart';



class registroProvider extends ChangeNotifier {
  // bool isLoading = true;
  dynamic _usuario = "";
  dynamic get usuario => _usuario;

  String _userNombre= '';
  String get userNombre=> _userNombre;

  String _usuarioApellido= '';
  String get usuarioApellido=> _usuarioApellido;

  String _telefono= '';
  String get telefono=> _telefono;

  String _email = '';
  String get email => _email;

  String _pass = '';
  String get pass => _pass;

  set userNombre(String value) => _userNombre = value;
  set usuarioApellido(String value) => _usuarioApellido = value;
  set telefono(String value) => _telefono = value;
  set pass(String value) => _pass = value;
  set email(String value) => _email = value;

  Future fetchRegistro(String userNombre, String usuarioApellido, String telefono,String email, String password, BuildContext context) async {

    final response = await http.post(
        Uri.parse(
            'https://apidigilist-production.up.railway.app/usuario/pre-registroCliente'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body:
            jsonEncode(<String, String>{"userNombre":userNombre,"usuarioApellido":usuarioApellido, "telefono":telefono,"email": email, "password": password}));
    print(response.body);
    print('sugey controladora ${response.statusCode}');
   
    if (response.statusCode == 200) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => VerificarCode()));
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('${jsonDecode(response.body)['errors'][0]['msg']}'),
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
