import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/providers/login_provider.dart';
import 'package:flutter_login_ui/screens/MyStatefulWidget.dart';
import 'package:flutter_login_ui/screens/perfil.dart';
import 'package:flutter_login_ui/screens/politicas.dart';
import 'package:provider/provider.dart';

import 'Inici.dart';
import 'botondescripcion.dart';
import 'carrito.dart';
import 'catalagodos.dart';
import 'configuraciones.dart';
import 'login_screen.dart';
import 'notificaciones.dart';

void main() => runApp(itemPage());

class itemPage extends StatelessWidget {
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
          appBar: AppBar(
            title: const Text('Descripcion del producto'),
          ),
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
                      
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Inicio'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Inicio_page()));
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
                        Navigator.push(
                            context, 
                            MaterialPageRoute(
                                builder: (context) => MyStatefulWidget()));
                      }),
                  Divider(),
                ],
              ),
            ),
          ),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Image.asset(
                  "assets/images/1.png",
                  height: 300,
                ),
              ),
              Arc(
                edge: Edge.TOP,
                arcType: ArcType.CONVEY,
                height: 30,
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 48,
                            bottom: 15,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Balatas",
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 3,
                                            blurRadius: 10,
                                            offset: Offset(0, 3),
                                          ),
                                        ]),
                                    child: Icon(
                                      CupertinoIcons.minus_circle,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "01",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(255, 37, 37, 37).withOpacity(0.5),
                                            spreadRadius: 3,
                                            blurRadius: 10,
                                            offset: Offset(0, 3),
                                          ),
                                        ]),
                                    child: Icon(
                                      CupertinoIcons.plus_circle,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            "Piezas metálicas curvilíneas con forma de semicírculo. Estas placas metálicas se recubren de materiales como el óxido de aluminio, hierro, magnesio, grafito e incluso cerámica. Las balatas, como mencionamos, forman parte del sistema de frenado de tu automóvil.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: botondescripcion(),
        ));
  }
}

class RatingBar {
  static builder(
      {required int initialRating,
      required int minRating,
      required int itemCount,
      required Axis direction,
      required int itemSize,
      required EdgeInsets itemPadding,
      required Icon Function(dynamic context, dynamic _) itemBuilder,
      required Null Function(dynamic index) onRatingUpdate}) {}
}
