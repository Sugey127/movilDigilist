import 'package:flutter/material.dart';
import 'package:flutter_login_ui/providers/login_provider.dart';
import 'package:flutter_login_ui/providers/provider_autopartes.dart';
import 'package:flutter_login_ui/providers/provider_buscarYear.dart';
import 'package:flutter_login_ui/providers/provider_marca.dart';
import 'package:flutter_login_ui/providers/provider_modelos.dart';
import 'package:flutter_login_ui/providers/provider_year.dart';
import 'package:flutter_login_ui/screens/MyStatefulWidget.dart';
import 'package:flutter_login_ui/screens/login_screen.dart';
import 'package:flutter_login_ui/providers/provider_buscarMarca.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static const String _title = 'Digilist';

  @override
  Widget build(BuildContext context) {
    String dato = '';
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AutoparteProvider>(
            create: (context) => AutoparteProvider()..fetchAutopartes(),
          ),
          ChangeNotifierProvider(
              create: (context) => MarcaProvider()..fetchMarcas()),
          ChangeNotifierProvider<ModeloProvider>(
              create: (context) => ModeloProvider()..fetchModelos()),
          ChangeNotifierProvider<YearProvider>(
              create: (context) => YearProvider()..fetchYears()),
          ChangeNotifierProvider<BucarModeloPorMarca>(
              create: (context) => BucarModeloPorMarca()),
          ChangeNotifierProvider<BucarModeloPorYear>(
              create: (context) => BucarModeloPorYear()),
          ChangeNotifierProvider<loginProvider>(
              create: (context) => loginProvider())
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          debugShowCheckedModeBanner: false,
          title: _title,
          home: Scaffold(
            appBar: AppBar(title: const Text(_title)),
            body: const MyStatefulWidget(),
          ),
        ));
  }
}
