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

            SizedBox(
                height: 50,
              ),

            Center(
                child: Container(
                width: 150,
                height: 150,
                color: Color.fromARGB(255, 255, 255, 255),
                child: Image.asset('assets/logos/logo_proyecto.png'),
                ),
              ),

               SizedBox(
                height: 50,
              ),

          Align(
            alignment: Alignment.topCenter,
        child: SizedBox(
          width: 450,
            child: TextFormField(
              style: TextStyle( height: 2.0, color: Colors.black),
              controller: _codeController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                hintText: 'Ingresa tu codigo',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
        ),

         SizedBox(
                height: 40,
              ),

             Align(
            alignment: Alignment.topCenter,
            child: ElevatedButton(
             style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            // side: BorderSide(color: Colors.yellow, width: 5),
            textStyle: const TextStyle(
                color: Colors.white, fontSize: 15, fontStyle: FontStyle.normal),
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ), 
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
