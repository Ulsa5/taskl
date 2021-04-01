import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(LoginPage());
}

class Splash extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Taskl v1.0',
        theme: ThemeData(
            primarySwatch: Colors.green,
            buttonTheme: ButtonThemeData(height: 5, buttonColor: Colors.green)),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Taskl'),
            ),
            body: new Stack(//fit: StackFit.expand,
                children: <Widget>[
              new Center(
                  child: Image(
                      image: new AssetImage('images/logo.png'), height: 55)),
            ])));
  }
}
