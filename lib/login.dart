import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  Widget createUserInput() {
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

  Widget createLoginButton() {
    return Container(
      padding: const EdgeInsets.all(50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.green, onPrimary: Colors.white),
        child: Text('Ingresar'),
        onPressed: () {},
      ),
    );
  }

  Widget createAccountLink() {
    return Container(
        padding: const EdgeInsets.only(top: 32),
        child: Text(
          '¿No tienes una cuenta? Registrate!',
          textAlign: TextAlign.right,
          style: TextStyle(fontWeight: FontWeight.bold),
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
              height: 250,
            ),
            createUserInput(),
            createPasswordInput(),
            createLoginButton(),
            createAccountLink()
          ]),
        ),
      ),
    );
  }
}
