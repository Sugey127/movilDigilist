import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/providers/provider_carritoAgregar.dart';
import 'package:flutter_login_ui/screens/carrito.dart';
import 'package:provider/provider.dart';


void main() => runApp(botondescripcion());

class botondescripcion extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
       // final carritoinfo = Provider.of<CarritoProvider>(context);
    return BottomAppBar(
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ]
        ),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$120",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
