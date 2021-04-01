import 'package:flutter/material.dart';
import 'package:taskl/login.dart';
import 'package:taskl/splash.dart';
import 'package:taskl/register.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/splash': (context) => Splash(),
      '/login': (context) => LoginPage(),
      '/register': (context) => RegisterPage(),
    },
    initialRoute: '/splash',
  ));
}
