import 'package:flutter/material.dart';
import 'package:flutter_login_ui/screens/perfil.dart';
import 'package:flutter_login_ui/screens/politicas.dart';
//inicio

import 'Inici.dart';
import 'carritoItemSamples.dart';
import 'cartBottomNavBar.dart';
import 'catalagodos.dart';
import 'configuraciones.dart';
import 'login_screen.dart';
import 'notificaciones.dart';

void main() => runApp(carrito());

class carrito extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
        //title: 'material app',
        home: Scaffold(
          drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 255, 237, 212),
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Andrea_Rodriguez.com"),
                accountEmail: Text("Andrea@gmail.com"),
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
                        MaterialPageRoute(builder: (context) => LoginScreen()));
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
              title: const Text('Carrito'),
            ),
            body: ListView(
              children: [
                Container(
                  height: 700,
                  padding: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 185, 185, 187),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)
                    ),
                  ),
                  child: Column(children: [
                      carritoItemSamples(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        padding: EdgeInsets.all(10),
                        child: Row(children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 0, 0),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              " Add Coupon Code",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                ),
                            ),
                          ),
                        ],),
                      ),
                    ],
                  ),
                ),
              ],
           ),
           bottomNavigationBar: cartBottomNavBar(),
        ),
      );
  }
}
