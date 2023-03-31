// Dart 2.17.0
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_login_ui/providers/login_provider.dart';
import 'package:flutter_login_ui/screens/recuperarContrasenia.dart';
import 'package:provider/provider.dart';
import 'package:flutter_login_ui/screens/verificarCode.dart';


import 'RegistroUsers.dart';
//import 'package:iniciodesesion/pages/RegistroUsers.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

//login
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _correoController = TextEditingController();
  final _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginInfo = Provider.of<loginProvider>(context);
    return Scaffold(

     
      body: Form(
      
    key: _formKey,

    //SingleChildScrollView es para que cuando lo hagan   
    child: SingleChildScrollView(
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
            color: Color.fromARGB(255, 238, 238, 238),
            child: Image.asset('assets/logos/logo_proyecto.png'),
            ),
          ),

            SizedBox(
                height: 40,
              ),

      Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 350,
          child: TextFormField(
            style: TextStyle( height: 2.0, color: Colors.black),
            controller: _correoController,
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
              obscureText: true,
            controller: _passController,
            decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
              hintText: 'Ingresa tu contraseña',
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
            // side: BorderSide(color: Colors.yellow, width: 5),
            textStyle: const TextStyle(
                color: Colors.white, fontSize: 15, fontStyle: FontStyle.normal),
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
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
              
              child: const Text('         Iniciar         '),
              
            ),
          ),
          SizedBox(
                height: 10,
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegistroUsers()));
              },
              child: const Text('       Registrarme       '),
            ),
          ),

              SizedBox(
                height: 10,
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RecuperarContrasenia()));
    
                },
                child: const Text('   Recuperar contraseña   '),
              ),
            ),

            SizedBox(
              height: 10,
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => VerificarCode ()));
    
                },
                child: const Text('    Codigo de Verificacion    '),
              ),
            ),
          
        ],
      ),  
      ),
      ),
    );
  }
}
