import 'package:flutter/material.dart';
import 'package:flutter_login_ui/providers/provider_autopartes.dart';
import 'package:flutter_login_ui/screens/carrito.dart';
import 'package:flutter_login_ui/screens/itemPage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() => runApp(itemsWidget());
//inicio

class itemsWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final autoparteInfo = Provider.of<AutoparteProvider>(context);
    return Expanded(
      child: GridView.count(
        //childAspectRatio: 0.68,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 1,
        shrinkWrap: true,
        children: [
          //for(int i=0; i<4; i++)
          ListView.builder(
            itemCount: autoparteInfo.autopartes.length,
            itemBuilder: (BuildContext context, int index) {
              
              return Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 9),
                margin: EdgeInsets.symmetric(vertical: 3, horizontal: 10),                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 213, 209, 209),
                 borderRadius: BorderRadius.circular(10),
                 
                ),
                
                child: Column(
                  children: [
                    Container(
                     alignment: Alignment.topCenter,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 153, 0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text( "Descuento: ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      
                  
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => itemPage()));
                      },
                      child: Center(

                        child:  Image.asset(
                          "assets/images/1.png",
                          height: 100,
                          width: 150,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text('Nombre: ' +
                        autoparteInfo.autopartes[index]['nombreAutoparte'],
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Descripcion: ' ,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Precio: ' +
                                autoparteInfo.autopartes[index]['precio']
                                    .toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          //Aqui es donde se supone que se almacena el icono
                          IconButton(
                              icon: Icon(Icons.shopping_cart_checkout),
                              color: Colors.white, onPressed: () { },
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
