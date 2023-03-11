import 'package:flutter/material.dart';
import 'package:flutter_login_ui/screens/Inici.dart';

class RegistroUsers extends StatefulWidget {
  const RegistroUsers({super.key});

  @override
  State<RegistroUsers> createState() => _RegistroUsersState();
    static const String _title = 'Digilist';

}

class _RegistroUsersState extends State<RegistroUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              TextFormField(
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
                Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Inicio_page()));
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
