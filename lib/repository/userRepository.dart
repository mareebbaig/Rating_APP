import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<dynamic> signup(String email, String username, String password) async {
    var response = await http.post(
      Uri.parse("http://192.168.3.150:3500/v1/Signup"),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      },
      body: jsonEncode(
        <String, String>{
          'email': email,
          'username': username,
          'password': password,
        },
      ),
    );
    return response.body;
  }

  Future<dynamic> registerCompany(
      String company_name, String city, String? userId) async {
    try {
      var response = await http.post(
        Uri.parse("http://192.168.3.150:3500/v1/Signup/CompanyDetails"),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
        body: jsonEncode(
          <String, String>{
            "company_name": company_name,
            "city": city,
            "userId": userId!
          },
        ),
      );
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> insertReview(String? userId, String? compId, String empName,
      String review, String rating) async {
    try {
      var response = await http.post(
        Uri.parse("http://192.168.3.150:3500/v1/InsertEmpData"),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
        body: jsonEncode(
          <String, dynamic>{
            "userId": userId!,
            "compId": compId!,
            'username': empName,
            'review': review,
            'rating': rating,
          },
        ),
      );
      print(response.body);
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> login(String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse("http://192.168.3.150:3500/v1/Login"),
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
      return response;
    } catch (e) {
      print(e);
    }
  }
}
