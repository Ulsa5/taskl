import 'package:flutter/material.dart';
import 'package:taskl/controllers/databasehelpers.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  DataBaseHelper dataBaseHelper = new DataBaseHelper();

  String msgStatus = '';

  final TextEditingController nombreController = new TextEditingController();
  final TextEditingController emailOrPhoneController =
      new TextEditingController();
  final TextEditingController usuarioController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  _onPressed() {
    setState(() {
      if (usuarioController.text.trim().isNotEmpty &&
          passwordController.text.trim().isNotEmpty) {
        dataBaseHelper
            .registerUserData(
                nombreController.text.trim(),
                emailOrPhoneController.text.trim().toLowerCase(),
                usuarioController.text.trim(),
                passwordController.text.trim())
            .whenComplete(() {
          if (dataBaseHelper.status) {
            _showDialog();
            msgStatus = 'Check user or password';
          } else {
            Navigator.pushReplacementNamed(context, '/main');
          }
        });
      }
    });
  }

  Widget createUserInput(String hintText, controlador) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      child: TextField(
        controller: controlador,
        autofocus: true,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green, width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green)),
            border: const OutlineInputBorder(),
            labelText: hintText,
            labelStyle: TextStyle(color: Colors.black)),
        //hintText: 'Usuario o correo electrónico'),
      ),
    );
  }

  Widget createPasswordInput(String hintText, controlador) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        child: TextField(
          controller: controlador,
          decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green, width: 1),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green)),
              border: const OutlineInputBorder(),
              labelText: hintText,
              labelStyle: new TextStyle(color: Colors.black)),
          //hintText: 'Contraseña'),
          obscureText: true,
        ));
  }

  Widget createLoginButton(context, String nombre) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 70, right: 70),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.green, onPrimary: Colors.white),
          child: Text(nombre),
          onPressed: () {
            _onPressed();
          } /* {
          Navigator.pushNamed(context, direccion);
        },*/
          ),
    );
  }

  Widget createBackButton(context, nombre, direccion) {
    String _nombre = nombre;
    String _direccion = direccion;
    return Container(
        padding: const EdgeInsets.only(top: 10, left: 70, right: 70),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.red, onPrimary: Colors.white),
            child: Text(_nombre),
            onPressed: () {
              Navigator.pushNamed(context, _direccion);
            }
            //tooltip:'Salir',
            //child: new Icon(Icons.close)
            ));
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
            Padding(padding: EdgeInsets.only(top: 50)),
            createUserInput("Nombre", nombreController),
            createUserInput("Correo / Teléfono", emailOrPhoneController),
            createUserInput("Usuario o correo electrónico", usuarioController),
            createPasswordInput("Contraseña", passwordController),
            createPasswordInput("Repite la contraseña", null),
            createLoginButton(context, "Registrarse"),
            createBackButton(context, "Cancelar", '/login'),

            //Para el mensaje de estado de la conexion
            new Padding(
              padding: new EdgeInsets.only(top: 44.0),
            ),
            Container(
              height: 50,
              child: new Text(
                '$msgStatus',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 44.0),
            ),
          ]),
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Failed'),
            content: new Text('Check your email or password'),
            actions: <Widget>[
              // ignore: deprecated_member_use
              new RaisedButton(
                child: new Text(
                  'Close',
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
