/* import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(Splash());
}

class Splash extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Taskl v1.0',
        theme: ThemeData(
          primarySwatch: Colors.green,
          buttonTheme: ButtonThemeData(height: 5, buttonColor: Colors.green),
        ),
        routes: <String, WidgetBuilder>{
          "/inicio": (BuildContext context) => Splash(),
          "/login": (BuildContext context) => LoginPage(),
        },
        home: Scaffold(
            //appBar: AppBar(
            //title: Text('Taskl'),
            //),
            body: new Stack(children: <Widget>[
          new Center(
            child: InkWell(
                child: Image.asset(
                  'images/logo.png',
                  height: 75,
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/inicio");
                }),
          ),

          /* 
              child: InkWell(
            child: FadeInImage.assetNetwork(
              placeholder: 'images/logo.png',
              image: 'images/logo.png',
              height: 55,
            ),
            onPressed: () {},
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            }, */
          /* new Center(
              child: InkWell(
            child: Image(image: new AssetImage('images/logo.png'), height: 55),
            onTap: () => launch('https://facebook.com'),
          )), */
        ])));
  }
}

/*
_irAlLogin() async {
  const url = 'https://google.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'no se puede abrir $url';
  }
}
*/
 */
