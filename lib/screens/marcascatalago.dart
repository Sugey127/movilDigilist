import 'package:flutter/material.dart';
import 'package:flutter_login_ui/providers/provider_buscarMarca.dart';
import 'package:flutter_login_ui/providers/provider_marca.dart';
import 'package:flutter_login_ui/screens/modelocatalago.dart';
import 'package:flutter_login_ui/screens/perfil.dart';
import 'package:flutter_login_ui/screens/politicas.dart';
import 'package:provider/provider.dart';

import 'Inici.dart';
import 'carrito.dart';
import 'catalagodos.dart';
import 'configuraciones.dart';
import 'login_screen.dart';
import 'modeloPorMarca.dart';
import 'notificaciones.dart';

void main() => runApp(marcascatalago());

class marcascatalago extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final marcasInfo = Provider.of<MarcaProvider>(context);
    final buscarModeloInfo = Provider.of<BucarModeloPorMarca>(context);

    //String  marcaModeloMarca.marca;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => configuraciones()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.description),
                      title: Text('Politicas'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => politicas()));
                      },
                    ),
                    Divider(),
                    ListTile(
                        leading: Icon(Icons.shop),
                        title: Text('Carrito'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => carrito()));
                        }),
                    ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: Text('Salir'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        }),
                  ],
                ),
              ),
            ),
            appBar: AppBar(
              title: const Text('Marcas'),
            ),
            body: ListView.builder(
              itemCount: marcasInfo.marcas.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    buscarModeloInfo.marca = marcasInfo.marcas[index]['marca'];
                    print(buscarModeloInfo.marca);
                    buscarModeloInfo.fetchBuscarMarca();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ModeloMarcaModelo()),
                    );
                  },
                  child: ListTile(
                    title: Text('Marca de automóvil: ' +
                        marcasInfo.marcas[index]['marca']),
                    leading: Icon(Icons.numbers),
                  ),
                );
              },
            )));
  }

  // Widget _buildItem(String textTitle) {

  // return new ListTile(
  //     title: new Text(textTitle),
  //     leading: new Icon(Icons.numbers),
  //      onTap: (){
  //       print(textTitle);
  //     },
  // );
}
