import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../screens/Inici.dart';

class RecuperarContraseniaProvider extends ChangeNotifier {
  String _code = "";
  String get code => _code;

  String _email = "";
  String get email => _email;

  set code(String value) => _code = value;
  set email(String value)=> _email=value;

  dynamic _codes = "";
  dynamic get codes => _codes;

  Future fetchRecuperarContrasenia(String email, String newPass, BuildContext context,) async {
    final url = Uri.parse(
        'https://digilist.fly.dev/usuario/olvidarContrasena?email=$email&password=$newPass');

        print('NO JALAAAAAAAAAAAAAAAAAAAAAAAAAAAA ${email}');
      final response = await http.post(url);
      print('AAAAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHHHHHHHH ${response.statusCode}');
      print(response.body);
      if (response.statusCode == 200) {
        print('ASUUUUUU ${response.body}');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Inicio_page()));
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
