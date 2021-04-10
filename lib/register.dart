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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(
                top: 60, left: 12.0, right: 12, bottom: 60),
            children: <Widget>[
              //containers
              //Logo centro -> arriba
              Image.asset(
                'images/logo.png',
                height: 60,
              ),

              //Textfield nombre
              Container(
                padding: const EdgeInsets.only(
                    top: 50, right: 30, left: 30, bottom: 5),
                child: TextField(
                  controller: nombreController,
                  autofocus: true,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.green, width: 1),
                      ),
                      isDense: true,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.green),
                      ),
                      border: const OutlineInputBorder(),
                      labelText: "Nombre",
                      labelStyle: TextStyle(color: Colors.black, fontSize: 15)),
                ),
              ),

              //Textfield Correo/Telefono
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextField(
                  controller: emailOrPhoneController,
                  autofocus: true,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.green, width: 1),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.green),
                      ),
                      isDense: true,
                      border: const OutlineInputBorder(),
                      labelText: "Correo / Teléfono",
                      labelStyle: TextStyle(color: Colors.black, fontSize: 15)),
                ),
              ),

              //Textfield Nombre de Usuario
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextField(
                  controller: usuarioController,
                  autofocus: true,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.green, width: 1),
                      ),
                      isDense: true,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.green),
                      ),
                      border: const OutlineInputBorder(),
                      labelText: "Nombre de usuario",
                      labelStyle: TextStyle(color: Colors.black, fontSize: 15)),
                ),
              ),

              //Textfield Contraseña
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.green, width: 1),
                      ),
                      isDense: true,
                      focusedBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.green)),
                      border: const OutlineInputBorder(),
                      labelText: "Contraseña",
                      labelStyle:
                          new TextStyle(color: Colors.black, fontSize: 15)),
                  obscureText: true,
                ),
              ),

              //Botón registrarse
              Container(
                padding: const EdgeInsets.only(top: 25, left: 90, right: 90),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green, onPrimary: Colors.white),
                    child: Text("Registrarse"),
                    onPressed: () {
                      _onPressed();
                    }),
              ),

              //Botón cancelar
              Container(
                padding: const EdgeInsets.only(top: 5, left: 90, right: 90),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red, onPrimary: Colors.white),
                    child: Text("Cancelar"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    }),
              ),
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
            ],
          ),
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
      },
    );
  }
}
