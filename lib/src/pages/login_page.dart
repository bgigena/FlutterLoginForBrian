import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../login_state.dart';

class LoginPage extends StatefulWidget {

  @override
  LoginPageState createState(){
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> { 
  final globalK = new GlobalKey<FormState>();
  String _usrEntered;
  String _passEntered;
  bool _err=false;
  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _createBackground( context ),
          _loginForm( context ),
        ],
      )
    );
  }
  

  Widget _loginForm(BuildContext context) {

    final size = MediaQuery.of(context).size;
     

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),

          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric( vertical: 50.0 ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Form(
              key: globalK,
              child:Column(
              children: <Widget>[
                Text('Log with admin account', style: TextStyle(fontSize: 20.0)),
                SizedBox( height: 60.0 ),
                _crearEmail(),
                SizedBox( height: 30.0 ),
                _crearPassword(),
                SizedBox( height: 30.0 ),
                _crearBoton(),
                
              ],
            ),
            ),
          ),
        
          SizedBox( height: 100.0 )
        ],
      ),
    );


  }

  Widget _crearEmail() {
      
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),

        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon( Icons.alternate_email, color: Colors.deepPurple ),
            hintText: 'example@mail.com',
            labelText: 'Email Adress',
          ),
          validator: (input) => input == null || input == '' || _err ? 'Invalid username' : null,
          onSaved: (input) => _usrEntered = input,
        ),
      );
}

  Widget _crearPassword() {

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),

          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon( Icons.lock_outline, color: Colors.deepPurple ),
              labelText: 'Password',
             ),
            validator: (input) => input == null || input == '' || _err ? 'Invalid password' : null,
            onSaved: (input) => _passEntered = input,
          ),
        );
}

  Widget _crearBoton() {

        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 15.0),
            child: Text('Login'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,
            onPressed: _submit,
        );
      }
  void _submit(){
        _err=false;
        if (globalK.currentState.validate()) {
          globalK.currentState.save();
         _err = Provider.of<LoginState>(context).login(_usrEntered, _passEntered);
         if(_err)
            globalK.currentState.validate();
        }
  }
  Widget _createBackground(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final violetBackground = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0)
          ]
        )
      ),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );


    return Stack(
      children: <Widget>[
        violetBackground,
        Positioned( top: 90.0, left: 30.0, child: circulo ),
        Positioned( top: -40.0, right: -30.0, child: circulo ),
        Positioned( bottom: -50.0, right: -10.0, child: circulo ),
        Positioned( bottom: 120.0, right: 20.0, child: circulo ),
        Positioned( bottom: -50.0, left: -20.0, child: circulo ),
        
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Icon( Icons.person_pin_circle, color: Colors.white, size: 100.0 ),
              SizedBox( height: 10.0, width: double.infinity ),
              Text('Braian Gigena', style: TextStyle( color: Colors.white, fontSize: 25.0 ))
            ],
          ),
        )

      ],
    );

  }
}