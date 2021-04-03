import 'package:flutter/material.dart';
import 'package:taskl/login.dart';
import 'package:taskl/splash.dart';
import 'package:taskl/register.dart';
import 'package:taskl/main.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/splash': (context) => Splash(),
      '/login': (context) => LoginPage(),
      '/register': (context) => RegisterPage(),
      '/main': (context) => Main(),
    },
    //initialRoute: '/main',
    initialRoute: '/splash',
  ));
}
