import 'package:http/http.dart' as http;
import 'dart:convert';
import 'logger.dart';

class Controller {
  Future<dynamic> login(String email, String password) async {
    try {
      print(password);
      var response = await http.post(
        Uri.parse('http://localhost:3500/v1/Login'),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
        body: jsonEncode(
          <String, String>{
            'email': email,
            'password': password,
          },
        ),
      );
      logger.d("yahan response agya hai : ", response);
    } catch (e) {
      print(e);
    }
  }
}
