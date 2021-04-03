import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  final usuario = TextEditingController();
  final contrasenia = TextEditingController();

  String user = '';
  String pass = '';

  Widget createUserInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      child: TextField(
        autofocus: true,
        controller: usuario,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green, width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green)),
            border: const OutlineInputBorder(),
            labelText: 'Usuario o correo electronico',
            labelStyle: TextStyle(color: Colors.black)),
        //hintText: 'Usuario o correo electrónico'),
      ),
    );
  }

  Widget createPasswordInput() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        child: TextField(
          controller: contrasenia,
          decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green, width: 1),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green)),
              border: const OutlineInputBorder(),
              labelText: 'Contraseña',
              labelStyle: new TextStyle(color: Colors.black)),
          //hintText: 'Contraseña'),
          obscureText: true,
        ));
  }

  Widget createLoginButton(context, nombre, direccion) {
    String _nombre = nombre;
    String _direccion = direccion;
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 70, right: 70),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.green, onPrimary: Colors.white),
        child: Text(_nombre),
        onPressed: () {
          user = usuario.text;
          pass = contrasenia.text;

          if (user == 'saul' && pass == 'saul') {
            Fluttertoast.showToast(
                msg: "Bienvenido $user",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.green,
                fontSize: 16);
            Navigator.pushNamed(context, _direccion);
          } else {
            Fluttertoast.showToast(
                msg: "Usuario / contraseña incorrectos!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.green,
                fontSize: 16);
          }
        },
      ),
    );
  }

  Widget createExitButton(context, nombre) {
    String _nombre = nombre;
    return Container(
        padding: const EdgeInsets.only(top: 10, left: 70, right: 70),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.red, onPrimary: Colors.white),
            child: Text(_nombre),
            onPressed: () => exit(0)
            //tooltip:'Salir',
            //child: new Icon(Icons.close)
            ));
  }

  Widget createAccountLink(context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.only(top: 32),
        child: Text(
          '¿No tienes una cuenta? Registrate!',
          textAlign: TextAlign.right,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/register');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(color: Colors.white),
          child: ListView(children: [
            Image.asset(
              'images/logo.png',
              //width: 300,
              height: 50,
            ),
            Padding(padding: EdgeInsets.only(top: 100)),
            createUserInput(),
            createPasswordInput(),
            Padding(padding: EdgeInsets.only(top: 50)),
            createLoginButton(context, "Ingresar", '/main'),
            createExitButton(context, "Salir"),
            createAccountLink(context),
          ]),
        ),
      ),
    );
  }
}
