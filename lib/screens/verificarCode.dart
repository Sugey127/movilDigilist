// Dart 2.17.0
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/screens/Inici.dart';
import 'package:provider/provider.dart';
import '../providers/provider_verificarCode.dart';
import '../providers/registro_provider.dart';

class VerificarCode extends StatefulWidget {
  const VerificarCode({Key? key}) : super(key: key);

  @override
  State<VerificarCode> createState() => _VerificarCodeState();
  static const String _title = 'Digilist';
}

class _VerificarCodeState extends State<VerificarCode> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final registroInfo = Provider.of<VerificarCodigo>(context);
    return Scaffold(
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
                child: Container(
                width: 120,
                height: 120,
                color: Color.fromARGB(255, 255, 255, 255),
                child: Image.asset('assets/logos/logo_proyecto.png'),
                ),
              ),
            TextFormField(
              controller: _codeController,
              decoration: const InputDecoration(
                hintText: 'Ingresa tu codigo',
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
                  print(_codeController.text);
                  registroInfo.fetchCode(
                      _codeController.text,context);
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
