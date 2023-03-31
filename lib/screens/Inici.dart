import 'package:flutter/material.dart';
import 'package:flutter_login_ui/screens/MyStatefulWidget.dart';
import 'package:flutter_login_ui/screens/RegistroUsers.dart';
import 'package:flutter_login_ui/screens/carrito.dart';
import 'package:flutter_login_ui/screens/catalagodos.dart';
import 'package:flutter_login_ui/screens/login_screen.dart';
import 'package:flutter_login_ui/screens/notificaciones.dart';
import 'package:flutter_login_ui/screens/perfil.dart';
import 'package:flutter_login_ui/screens/politicas.dart';
import 'package:flutter_login_ui/screens/proveedor.dart';
import 'package:flutter_login_ui/providers/login_provider.dart';
import 'package:provider/provider.dart';


import '../utilities/categoriesWidget.dart';
import 'configuraciones.dart';

import 'itemsWidget.dart';

//inicio
void main() => runApp(Inicio_page());

class Inicio_page extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final loginInfo = Provider.of<loginProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //title: 'material app',
          theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
        home: Scaffold(
          drawer: Drawer(
            child: Container(
              color: Color.fromARGB(255, 251, 246, 239),
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
                    ),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => catalagodos()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Configuraciones'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => configuraciones()));
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.description),
                    title: Text('Politicas'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => politicas()));
                    },
                  ),
                   ListTile(
                      leading: Icon(Icons.shop),
                      title: Text('Carrito'),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => carrito()));
                      }),
                  ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text('Salir'),
                      onTap: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyStatefulWidget()));
                    },
                    ),
                 
                ],
              ),
            ),
          ),
          appBar: AppBar(
            title: const Text('Inicio'),
            
          ),
          body: ListView(
            children: [
              SizedBox(height: 10),
              Container(
                height: 100,    
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 10,
                ),
                
                child: Text(
                  "Categorias",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              categoriesWidget(),

              
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                 width: 100,
                
                child: Text(
                  "Best Selling",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              itemsWidget(),
            ],
          ),
        )
      );
  }
  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 0));
  }
}

/*  children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 50, bottom: 20),
                  child: Image.network("https://p77-sign-va.tiktokcdn.com/tos-maliva-avt-0068/603870422660542ae36b253bdf7af03b~c5_720x720.jpeg?x-expires=1674774000&x-signature=AQZPi7LQBTLCl7qbBaCbKhhYwQM%3D"),
                ),
                const Text("Andrea Rodriguez", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
              ],
            */