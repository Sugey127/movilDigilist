import 'package:flutter/material.dart';
import 'package:flutter_login_ui/screens/MyStatefulWidget.dart';
import 'package:flutter_login_ui/screens/perfil.dart';
import 'package:flutter_login_ui/screens/politicas.dart';
import 'package:flutter_login_ui/providers/login_provider.dart';
import 'Inici.dart';
import 'carrito.dart';
import '../utilities/categoriesWidget.dart';
import 'configuraciones.dart';
import 'itemsWidget.dart';
import 'itemsWidgetcatalago.dart';
import 'login_screen.dart';
import 'notificaciones.dart';
import 'package:provider/provider.dart';
//inicio

void main() => runApp(catalagodos());

class catalagodos extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  final loginInfo = Provider.of<loginProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
        //title: 'material app',
        home: Scaffold(
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
              title: const Text('Catalago'),
            ),
            body: ListView(
              children: [
              SizedBox(height: 20),
               Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration:  BoxDecoration(
                  color: Color(0xFFEDECF2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 50,
                      width: 300,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: " Search here .............",
                        ),
                      ),
                    ),
                  ],
                ),
               ),
               Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(
                  vertical: 20,
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
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  "Best Selling",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
               ),

               itemsWidgetcatalago(),
              ],
            ),
          )
        );
  }
}

