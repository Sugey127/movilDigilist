import 'package:flutter/material.dart';
import 'package:flutter_login_ui/providers/login_provider.dart';
import 'package:flutter_login_ui/screens/recuperarContrasenia.dart';
import 'package:provider/provider.dart';

import 'Inici.dart';
import 'RegistroUsers.dart';
//import 'package:iniciodesesion/pages/RegistroUsers.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
  static const String _title = 'hola';
}

//login
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _correoController = TextEditingController();
  final _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginInfo = Provider.of<loginProvider>(context);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _correoController,
            decoration: const InputDecoration(
              hintText: 'Ingresa tu correo',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passController,
            decoration: const InputDecoration(
              hintText: 'Ingresa tu contraseña',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // loginInfo.email = _correoController.text;
                // loginInfo.pass = _passController.text;
                // loginInfo.fetchLogin(loginInfo.email, loginInfo.pass);
                if (_formKey.currentState!.validate()) {
                  loginInfo.fetchLogin(
                      _correoController.text, _passController.text, context);
                  // print('que está entrandooooooooooooaaaaaaa?: ${loginInfo.statusCode}');
                }
              },
              child: const Text('login'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegistroUsers()));
              },
              child: const Text('Registrarme'),
            ),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RecuperarContrasenia()));
              },
              child: const Text('Recuperar contraseña'),
            ),
          ),
        ],
      ),
    );
  }
}
