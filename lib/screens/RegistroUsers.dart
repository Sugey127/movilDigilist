// Dart 2.17.0
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/registro_provider.dart';

class RegistroUsers extends StatefulWidget {
  const RegistroUsers({Key? key}) : super(key: key);

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
      appBar: AppBar(
            title: const Text(''),
            
          ),
      body: Form(

            child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

             SizedBox(
                height: 70,
              ),

            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 350,
              child:TextFormField(
                style: TextStyle( height: 2.0, color: Colors.black),
                controller: _userNombreController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                  hintText: 'Ingresa tu nombre',
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
              child:TextFormField(
              style: TextStyle( height: 2.0, color: Colors.black),
              controller: _usuarioApellidoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_outlined),
              hintText: 'Ingresa tu apellido',
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
            child:TextFormField(
              style: TextStyle( height: 2.0, color: Colors.black),
              controller: _telefonoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
                hintText: 'Ingresa tu telefono',
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
                textStyle: const TextStyle(
                color: Colors.white, fontSize: 15, fontStyle: FontStyle.normal),
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          
                ),
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
