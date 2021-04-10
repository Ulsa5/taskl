import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskl/login.dart';
//import 'package:http/http.dart' as http;

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                sharedPreferences.clear();
                // ignore: deprecated_member_use
                sharedPreferences.commit();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage()),
                    (Route<dynamic> route) => false);
                //Navigator.pushNamed(context, '/login');
              },
            ),
            title: Text('Tareas'),
            backgroundColor: Colors.green,
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text('Pendientes'),
                ),
                Tab(
                  child: Text('En Progreso'),
                ),
                Tab(
                  child: Text('Finalizadas'),
                ),
              ],
            ),
          ),
          //Ejemplo
          body: TabBarView(children: [
            Container(
              child: Center(
                child: Text('Tareas Pendientes'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Tareas en Progreso'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Tareas Finalizadas'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
