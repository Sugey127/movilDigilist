import 'package:flutter/material.dart';
import 'package:flutter_login_ui/providers/login_provider.dart';
import 'package:flutter_login_ui/providers/provider_year.dart';
import 'package:flutter_login_ui/screens/MyStatefulWidget.dart';
import 'package:flutter_login_ui/screens/perfil.dart';
import 'package:flutter_login_ui/screens/politicas.dart';
import 'package:flutter_login_ui/screens/proveedor.dart';
import 'package:provider/provider.dart';
import '../providers/provider_buscarYear.dart';
import 'Inici.dart';
import 'carrito.dart';
import 'catalagodos.dart';
import 'configuraciones.dart';
import 'login_screen.dart';
import 'modeloPorYear.dart';
import 'notificaciones.dart';

void main() => runApp(anocatalago());

class anocatalago extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final yaerInfo = Provider.of<YearProvider>(context);
    final buscarModeloInfoYear = Provider.of<BucarModeloPorYear>(context);
    final loginInfo = Provider.of<loginProvider>(context);

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
                      Divider(),
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
            title: const Text('Año'),
          ),
        

          body: (yaerInfo.year.isEmpty)
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
            itemCount: yaerInfo.year.length,
            itemBuilder: (BuildContext context, int index) {              
             
             return GestureDetector(
                  onTap: () {
                    buscarModeloInfoYear.year = yaerInfo.year[index]['year'].toString();
                    print(buscarModeloInfoYear.year);
                    buscarModeloInfoYear.fetchBuscaryear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ModeloPorYear()),
                    );
                  },
                  child: ListTile(
                    title: Text('Año del automóvil: ' + yaerInfo.year[index]['year'].toString() )
                    
                  ),
                );

             //return _buildItem('Año del automóvil: ' + yaerInfo.year[index]['year'].toString() );         
            },

        )));
  }
   Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 0));
  }
}
// Widget _buildItem(String textTitle) {
//   return new ListTile(
//       title: new Text(textTitle),
//       leading: new Icon(Icons.numbers),
//        onTap: (){
//         print(textTitle);
//       },
//   );
// }
