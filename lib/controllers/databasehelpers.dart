import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DataBaseHelper {
  String serverUrl = "https://obscure-plains-83532.herokuapp.com/api";
  String serverUrlRegister =
      "https://obscure-plains-83532.herokuapp.com/api/register";

  var status;
  var token;

  //funcion para el login

  loginData(String user, password) async {
    String myUrl = "$serverUrl/login";
    final response = await http.post(Uri.parse(myUrl), headers: {
      'Accept': 'application/json'
    }, body: {
      "usuario": "$user",
      "password": "$password",
    });

    status = response.body.contains("error");

    var data = json.decode(response.body);

    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data: ${data["token"]}');
      _save(data["token"]);
    }
  }

  //funcion para el registro de usuarios
  registerUserData(String nombre, emailOrPhone, user, password) async {
    String myUrl = "$serverUrl/register";
    final response = await http.post(Uri.parse(myUrl), headers: {
      'Accept': 'application/json'
    }, body: {
      "nombre": "$nombre",
      "correo_telefono": "$emailOrPhone",
      "usuario": "$user",
      "password": "$password",
    });

    status = response.body.contains('error');

    var data = json.decode(response.body);

    if (status) {
      print('data: ${data["error"]}');
    } else {
      print('data: ${data["token"]}');
      _save(data["token"]);
    }
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read: $value');
  }
}
