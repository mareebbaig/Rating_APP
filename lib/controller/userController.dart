import 'dart:convert';
import 'package:checkapp/models/user.dart';
import 'package:checkapp/repository/userRepository.dart';
import 'package:flutter/cupertino.dart';

class UserController {
  final UserRepository _userRepository = UserRepository();
  User? _user;

  User? get user => _user;

  Future<dynamic> tryLogin(String email, String password) async {
    var response = await _userRepository.login(email, password);
    var decodedData = jsonDecode(response.body);
    print(decodedData['data']);
    if (decodedData['data'] == []) {
      return {
        'code': 500,
        'error': "user does not exits",
      };
    } else if (decodedData['data']['error'] == null) {
      _user = User.fromJson(decodedData['data']);
      return decodedData;
    } else {
      return {
        'code': 500,
        'error': decodedData['data']['error'],
      };
    }
  }

  Future<dynamic> trySignup(
      String email, String username, String password) async {
    var response = await _userRepository.signup(email, username, password);
    var decodedData = jsonDecode(response);
    if (decodedData['code'] == 200) {
      _user = User.fromJson(decodedData['data']['res']);
      return decodedData['code'];
    } else {
      return decodedData['statusCode'];
    }
  }

  Future<dynamic> tryRegisterCompany(
      String company_name, String city, UserController? user) async {
    var response = await _userRepository.registerCompany(
        company_name, city, user?._user?.userId);
    var decodedData = jsonDecode(response.body);
    if (decodedData['code'] == 200) {
      user?._user!.compId = decodedData['data'][0]['compid'];
    }
    return decodedData['code'];
  }

  Future<dynamic> tryInsertingReview(UserController? user, String empName,
      String review, String rating) async {
    var response = await _userRepository.insertReview(
        user?._user?.userId, user?._user?.compId, empName, review, rating);
    var decodedData = jsonDecode(response.body);
    return decodedData['code'];
  }
}
