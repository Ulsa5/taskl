import 'dart:convert';
//import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usuario = new TextEditingController();
  final TextEditingController password = new TextEditingController();

  // ignore: unused_field
  bool _isLoading = false;

  signIn(String user, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'usuario': user,
      'password': pass,
    };

    // ignore: avoid_init_to_null
    var jsonResponse = null;

    var response = await http.post(
      Uri.parse("https://obscure-plains-83532.herokuapp.com/api/login"),
      //local
      //Uri.parse("http://192.168.0.11:8000/api/login"),
      body: data,
    );

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Main()),
            (Route<dynamic> route) => false);
      }
      //mensaje de bienvenida
      Fluttertoast.showToast(
          msg: "Bienvenido " + usuario.text,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          fontSize: 16);
    } else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }

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
          controller: password,
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

  Container createLoginButton() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 70, right: 70),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.green, onPrimary: Colors.white),
        child: Text(
          "Ingresar",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
          signIn(usuario.text, password.text);

          // Fluttertoast.showToast(
          //     msg: "Usuario / contraseña incorrectos!",
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.BOTTOM,
          //     backgroundColor: Colors.green,
          //     fontSize: 16);
        },
      ),
    );
  }

  Widget createExitButton(context, String nombre) {
    //String _nombre = nombre;
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 70, right: 70),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.red, onPrimary: Colors.white),
        child: Text(nombre),
        onPressed: () => exit(0),
        //tooltip:'Salir',
        //child: new Icon(Icons.close)
      ),
    );
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
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
            createLoginButton(),
            createExitButton(context, "Salir"),
            createAccountLink(context),
          ]),
        ),
      ),
    );
  }
}
