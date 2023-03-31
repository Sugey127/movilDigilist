import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/providers/login_provider.dart';
import 'package:flutter_login_ui/screens/MyStatefulWidget.dart';
import 'package:flutter_login_ui/screens/politicas.dart';
import 'package:provider/provider.dart';
import 'Inici.dart';
import 'carrito.dart';
import 'catalagodos.dart';
import 'configuraciones.dart';
import 'login_screen.dart';
import 'notificaciones.dart';
//inicio

void main() => runApp(MaterialApp(
      home: perfil(),
    ));

class perfil extends StatelessWidget {

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
                leading: Icon(Icons.book),
                title: Text('Catalago'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => catalagodos()));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => politicas()));
                },
              ),
              Divider(),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyStatefulWidget()));
                  }),
              
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Perfil'),
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
                height: 100.0,
                child: Center(
                      child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
              
                      // cambio de foto de perfil
                      
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                  ),
                ),
              )),
          Container(
                child: SingleChildScrollView(
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
                    title: Text('Nombre :'+'${loginInfo.nombre} '),
                    onTap: () => null,
                  ),
                  Divider(),
                 ListTile(
                    
                    leading: Icon(Icons.camera_front),
                    title: Text('Apellido: ' + '${loginInfo.apellido}'),
                    onTap: () => null,
                  ),
                  Divider(),
                  ListTile(
                    
                    leading: Icon(Icons.camera_front),
                    title: Text('Telefono: ' + '${loginInfo.telefono}'),
                    onTap: () => null,
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.camera_front),
                    title: Text('Correo: ' + loginInfo.email),
                    onTap: () => null,
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 250.00,
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

  //aqui va para subir la
  Widget bottomSheet() {
    return Container(
      height: 100.0,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text("Choose Profile photo",
          style: TextStyle(
            fontSize: 20.0,
          ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
              IconButton(
                onPressed: (){}, icon: Icon(Icons.camera),
                
              ),
              Text("Camara"),
                            IconButton(
                onPressed: (){}, icon: Icon(Icons.image),
                
              ),
              Text("Gallery"),
            ],
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
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/providers/provider_modelos.dart';
import 'package:flutter_login_ui/providers/registro_provider.dart';
import 'package:flutter_login_ui/screens/MyStatefulWidget.dart';
import 'package:flutter_login_ui/screens/politicas.dart';
import 'package:provider/provider.dart';
import 'Inici.dart';
import 'carrito.dart';
import 'catalagodos.dart';
import 'configuraciones.dart';
import 'login_screen.dart';
import 'notificaciones.dart';
//inicio

void main() => runApp(MaterialApp(
      home: perfil(),
    ));

class perfil extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final registroInfo = Provider.of<registroProvider>(context);
    return Scaffold(
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
        title: const Text('Perfil'),
      ),
      
        body:  (registroInfo.usuario.isEmpty)
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
                    itemCount: registroInfo.usuario.length,
                    itemBuilder: (BuildContext context, int index) {  
                      return Column(
                        children: [
                          _nombre (registroInfo.usuario[index],['nombre']),
                          _apellido ('Nombre: ' + registroInfo.usuario[index],['nombre']),

                        ],
                      );
                    
                    },
                  ),

        
      
    );
  }

  //aqui va para subir la
  

 
}




Widget _nombre(String textTitle, List<String> list) {
 return new
  Divider();
}

Widget _apellido(String textTitle, List<String> list) {
 return new  
   ListTile(
      title: new Text(textTitle),
      leading: new Icon(Icons.numbers),
       onTap: (){
        print(textTitle);
      },   
  );
}

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 0));
  }
*/