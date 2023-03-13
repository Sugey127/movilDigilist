import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../screens/Inici.dart';

class VerificarCodigo extends ChangeNotifier {
  String _code = "";
  String get year => _code;

  set year(String value) => _code = value;

  dynamic _codes = "";
  dynamic get years => _codes;

  Future fetchCode(String code, BuildContext context) async {
    final url = Uri.parse(
        'https://apidigilist-production.up.railway.app/usuario/registroCliente/$code');

        print('NO JALAAAAAAAAAAAAAAAAAAAAAAAAAAAA ${code}');
      final response = await http.post(url);
      print('AAAAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHHHHHHHH ${response.statusCode}');
      if (response.statusCode == 201) {
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
