import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_ui/screens/perfil.dart';
import 'package:flutter_login_ui/screens/recuperarcontra.dart';
import 'package:flutter_login_ui/utilities/constants.dart';
import 'Inici.dart';
import 'nuevacontra.dart';
import 'registro.dart';

//inicio

class recuperar extends StatefulWidget {
  @override
  recuperarcontra createState() => recuperarcontra();
}

class recuperarcontra extends State<recuperar> {
  bool _rememberMe = false;

  Widget _buildEmailTF() {
    
    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      SizedBox(height: 90,),
      Center(
        child: Container(
          width: 120,
          height: 120,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Image.asset('assets/logos/logo_proyecto.png'),
      ),
     ),

        Text(
          'Email',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  
 
  Widget _buildRememberMeCheckbox() {
    
    return Container(
      
      height: 30.0,
      child: Row(
        
        children: <Widget>[
        SizedBox(height: 90,),
          Theme(
            data:
                ThemeData(unselectedWidgetColor: Color.fromARGB(255, 0, 0, 0)),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Color.fromARGB(255, 251, 119, 11),
              activeColor: Color.fromARGB(255, 255, 255, 255),
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
                SizedBox(height: 20,),

          Text(
            'Remember me',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

//Aqui va el boton de login

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Color.fromARGB(255, 0, 0, 0),
          elevation: 2,
          backgroundColor: Color.fromARGB(255, 253, 253, 253),
        ),
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => cambiodecontra()));
        },
        child: Text('Enviar'),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 114, 114, 114),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 50.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     
                      _buildEmailTF(),
                      SizedBox(height: 20,),
                      _buildRememberMeCheckbox(),
                      _buildLoginBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
