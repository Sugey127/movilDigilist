import 'package:flutter/material.dart';
import 'package:flutter_login_ui/providers/provider_recuperarContrasenia.dart';
import 'package:flutter_login_ui/screens/Inici.dart';
import 'package:provider/provider.dart';
import '../providers/registro_provider.dart';

class RecuperarContrasenia extends StatefulWidget {
  const RecuperarContrasenia({super.key});

  @override
  State<RecuperarContrasenia> createState() => _RecuperarContraseniaState();
  static const String _title = 'Digilist';
}

class _RecuperarContraseniaState extends State<RecuperarContrasenia> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _contraseniaController = TextEditingController();
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final registroInfo = Provider.of<RecuperarContraseniaProvider>(context);
    return Scaffold(
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
              controller: _contraseniaController,
              decoration: const InputDecoration(
                hintText: 'Ingresa tu nueva contraseña',
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
                  print(_contraseniaController.text);
                  registroInfo.fetchRecuperarContrasenia(_emailController.text,_contraseniaController.text,context);
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
