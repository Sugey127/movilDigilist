// Dart 2.17.0
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/providers/provider_recuperarContrasenia.dart';
import 'package:flutter_login_ui/screens/Inici.dart';
import 'package:provider/provider.dart';
import '../providers/registro_provider.dart';

class RecuperarContrasenia extends StatefulWidget {
  const RecuperarContrasenia({Key? key}) : super(key: key);

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
      appBar: AppBar(
            title: const Text(''),
            
          ),
      body: Form(
            child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              
              SizedBox(
                height: 80,
              ),

              Center(
            
          child: Container(
            
            width: 150,
            height: 150,
            color: Color.fromARGB(255, 233, 232, 232),
            child: Image.asset('assets/logos/logo_proyecto.png'),
            ),
          ),

          SizedBox(
                height: 80,
              ),

          Align(
            alignment: Alignment.topCenter,
        child: SizedBox(
          width: 350,
            child: TextFormField(
              style: TextStyle( height: 2.0, color: Colors.black),     
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                hintText: 'Ingresa tu correo',
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
                //Use of SizedBox
                height: 20,
              ),

        Align(
          alignment: Alignment.topCenter,
        child: SizedBox(
          width: 350,
            child: TextFormField(
              style: TextStyle( height: 2.0, color: Colors.black),
              controller: _contraseniaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                hintText: 'Ingresa tu nueva contraseña',
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
                //Use of SizedBox
                height: 40,
              ),

            Align(
            alignment: Alignment.topCenter,
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                textStyle: const TextStyle(
                color: Colors.white, fontSize: 15, fontStyle: FontStyle.normal),
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          
                ),
                onPressed: () {
                  print(_contraseniaController.text);
                  registroInfo.fetchRecuperarContrasenia(_emailController.text,_contraseniaController.text,context);
                },
              child: const Text('          Iniciar          '),
              ),
            ),
          ],
        ),
            ),
      ),
    );
  }
}
