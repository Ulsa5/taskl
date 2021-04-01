import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  Widget createUserInput(hintText) {
    String _hintText = hintText;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green, width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green)),
            border: const OutlineInputBorder(),
            labelText: _hintText,
            labelStyle: TextStyle(color: Colors.black)),
        //hintText: 'Usuario o correo electrónico'),
      ),
    );
  }

  Widget createPasswordInput(hintText) {
    String _hintText = hintText;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        child: TextField(
          decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green, width: 1),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green)),
              border: const OutlineInputBorder(),
              labelText: _hintText,
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
          Navigator.pushNamed(context, _direccion);
        },
      ),
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
            Padding(padding: EdgeInsets.only(top: 50)),
            createUserInput("Nombre"),
            createUserInput("Correo / Teléfono"),
            createUserInput("Usuario o correo electrónico"),
            createPasswordInput("Contraseña"),
            createPasswordInput("Repite la contraseña"),
            createLoginButton(context, "Registrarse", '/login'),
            createLoginButton(context, "Cancelar", '/login'),
          ]),
        ),
      ),
    );
  }
}
