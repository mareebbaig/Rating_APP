import 'dart:convert';
import 'package:checkapp/models/company.dart';
import 'package:checkapp/models/employee.dart';
import 'package:checkapp/repository/compRepository.dart';
import 'package:checkapp/repository/employeeRepository.dart';
import 'package:flutter/cupertino.dart';

class EmployeeController extends ChangeNotifier {
  EmployeeRepository _empRepo = EmployeeRepository();
  bool _isLoading = false;
  bool get loading => _isLoading;
  List<Employee> _employees = [];
  Employee emp = Employee();

  List<Employee> get employee => _employees;

  Future<void> getEmployees(String compId) async {
    _isLoading = true;
    _employees = [];
    var response = await _empRepo.getEmployees(compId);
    var decodedData = jsonDecode(response.body);
    for (var m in decodedData['data']) {
      _employees.add(Employee.fromJson(m));
    }
    _isLoading = false;
    notifyListeners();
  }
}
