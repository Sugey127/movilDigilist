import 'package:flutter/material.dart';
import 'package:flutter_login_ui/screens/Inici.dart';
import 'package:provider/provider.dart';

import '../providers/registro_provider.dart';

class RegistroUsers extends StatefulWidget {
  const RegistroUsers({super.key});

  @override
  State<RegistroUsers> createState() => _RegistroUsersState();
  static const String _title = 'Digilist';
}

class _RegistroUsersState extends State<RegistroUsers> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _userNombreController = TextEditingController();
  final _usuarioApellidoController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final registroInfo = Provider.of<registroProvider>(context);
    return Scaffold(
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _userNombreController,
              decoration: const InputDecoration(
                hintText: 'Ingresa tu nombre',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _usuarioApellidoController,
              decoration: const InputDecoration(
                hintText: 'Ingresa tu apellido',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _telefonoController,
              decoration: const InputDecoration(
                hintText: 'Ingresa tu telefono',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
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
                  print(_userNombreController.text);
                  registroInfo.fetchRegistro(
                      _userNombreController.text,
                      _usuarioApellidoController.text,
                      _telefonoController.text,
                      _emailController.text,
                      _passController.text,
                      context);
                },
                child: const Text('iniciar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
