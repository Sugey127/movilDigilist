import 'package:flutter/material.dart';
import 'package:flutter_login_ui/screens/itemsWidget.dart';
import 'package:flutter_login_ui/screens/marcascatalago.dart';
import 'package:flutter_login_ui/screens/perfil.dart';

import '../screens/Inici.dart';
import '../screens/anocatalago.dart';
import '../screens/modelocatalago.dart';

void main() => runApp(categoriesWidget());
//inicio

class categoriesWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      
      child: Row(       
        
        children: [   
           Container(
              padding: const EdgeInsets.only(
                  top: 4,
                  left: 10,
                ),
                child: Icon(
                    Icons.car_crash,
                    color: Color.fromARGB(255, 255, 160, 27),
                  ),
            ), 
            Container(
              
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(20),
              ),    
                        
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [                                    
                Padding(                                                           
                padding: EdgeInsets.all(5),             
                child: TextButton(  
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => marcascatalago()));
                },
                child: Text('Marca',
                style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
      ),                                          
                 ),                                                   
                ],                
              ),          
            ),
           
          Container(
              padding: const EdgeInsets.only(
                  top: 4,
                  left: 10,
                ),
                child: Icon(
                    Icons.car_crash,
                    color: Color.fromARGB(255, 255, 160, 27),
                  ),
            ), 
            Container(
              
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(20),
              ),    
                        
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [                                    
                Padding(                                                           
                padding: EdgeInsets.all(5),             
                child: TextButton(  
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => modelocatalago()));
                },          
                child: Text('Modelo',
                style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
      ),                                          
                 ),                                                   
                ],                
              ),          
            ),

Container(
              padding: const EdgeInsets.only(
                  top: 4,
                  left: 10,
                ),
                child: Icon(
                    Icons.calendar_month,
                    color: Color.fromARGB(255, 255, 160, 27),
                  ),
            ), 
            Container(
              
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(20),
              ),    
                        
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [                                    
                Padding(                                                           
                padding: EdgeInsets.all(5),             
                child: TextButton(  
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => anocatalago()));
                },          
                child: Text('Año',
                style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
      ),                                          
                 ),                                                   
                ],                
              ),          
            ),
        ],
      ),
    );
  }
}
