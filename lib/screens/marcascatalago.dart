import 'package:flutter/material.dart';
import 'package:flutter_login_ui/providers/login_provider.dart';
import 'package:flutter_login_ui/providers/provider_buscarMarca.dart';
import 'package:flutter_login_ui/providers/provider_marca.dart';
import 'package:flutter_login_ui/screens/MyStatefulWidget.dart';
import 'package:flutter_login_ui/screens/modelocatalago.dart';
import 'package:flutter_login_ui/screens/perfil.dart';
import 'package:flutter_login_ui/screens/politicas.dart';
import 'package:flutter_login_ui/screens/proveedor.dart';
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
    final loginInfo = Provider.of<loginProvider>(context);
    final marcasInfo = Provider.of<MarcaProvider>(context);
    final buscarModeloInfo = Provider.of<BucarModeloPorMarca>(context);

    //String  marcaModeloMarca.marca;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
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
                    leading: Icon(Icons.book),
                    title: Text('Provedor'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => proveedor()));
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
                                  builder: (context) => MyStatefulWidget()));
                        }),
                  ],
                ),
              ),
            ),
            appBar: AppBar(
              title: const Text('Marcas'),
            ),
            body: (marcasInfo.marcas.isEmpty)
            ? RefreshIndicator(
            onRefresh: _refresh,
            child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.hourglass_bottom_rounded, color: Colors.grey),
                    SizedBox(height: 10.0),
                    Text(
                      'Sin datos por el momento.....',
                      style: TextStyle(fontSize: 20.0, color: Colors.grey),
                    )
                  ],
                ),
              ),
          ):
            
            ListView.builder(
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

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 0));
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
