import 'package:flutter/material.dart';
import 'package:flutter_login_ui/providers/login_provider.dart';
import 'package:flutter_login_ui/screens/MyStatefulWidget.dart';
import 'package:flutter_login_ui/screens/perfil.dart';
import 'package:flutter_login_ui/screens/politicas.dart';
import 'package:provider/provider.dart';
import 'Inici.dart';
import 'carrito.dart';
import 'catalagodos.dart';
import 'login_screen.dart';
import 'notificaciones.dart';
//inicio

void main() => runApp(MaterialApp(
      home: configuraciones(),
    ));

class configuraciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final loginInfo = Provider.of<loginProvider>(context);
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 255, 237, 212),
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('${loginInfo.nombre} ${loginInfo.apellido}'),
                accountEmail: Text(loginInfo.email),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      "https://pbs.twimg.com/profile_images/1214740235336200197/vo2eRdio_400x400.jpg",
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 157, 28),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg'),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Inicio'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Inicio_page()));
                },
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text('Perfil'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => perfil()));
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.book),
                title: Text('Catalago'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => catalagodos()));
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notificaciones'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => notificaciones()));
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configuraciones'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => configuraciones()));
                },
              ),
              ListTile(
                leading: Icon(Icons.description),
                title: Text('Politicas'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => politicas()));
                },
              ),
              Divider(),
              ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Salir'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyStatefulWidget()));
                  }),
              ListTile(
                  leading: Icon(Icons.shop),
                  title: Text('Carrito'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => carrito()));
                  }),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Configuraciones'),
      ),
      body: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromARGB(255, 255, 102, 0),
                    Color.fromARGB(255, 255, 230, 0)
                  ])),
              child: Container(
                width: double.infinity,
                height: 30.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              )),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.camera_front),
                    title: Text('Cambiar_Nombre_De_Usuario: Andrea23'),
                    onTap: () => null,
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.camera_front),
                    title: Text('Cambiar_Correo_Electronico: andrearodriguez.@gmail.com'),
                    onTap: () => null,
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.camera_front),
                    title: Text('Cambiar_Numero_Telefonico: 9992345476'),
                    onTap: () => null,
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.camera_front),
                    title: Text('Cambiar_Nombre: Andrea_Rodriguez'),
                    onTap: () => null,
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.camera_front),
                    title: Text('Cambiar_Correo_Electronico: andrearodriguez.@gmail.com'),
                    onTap: () => null,
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.camera_front),
                    title: Text('Cambiar_Contraseña: ******************'),
                    onTap: () => null,
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 300.00,
            child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Color.fromARGB(255, 255, 157, 0),
                          Colors.pinkAccent
                        ]),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Contact me",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  RaisedButton(
      {required Null Function() onPressed,
      required RoundedRectangleBorder shape,
      required double elevation,
      required EdgeInsets padding,
      required Ink child}) {}
}
/*
 Divider(),
                  ListTile(
                    leading: Icon(Icons.camera_front),
                    title: Text('Numero_Telefonico: 9992345476'),
                    onTap: () => null,
                  ),
                  Divider(),
*/