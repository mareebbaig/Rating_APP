import 'dart:convert';
import 'package:checkapp/models/company.dart';
import 'package:checkapp/repository/compRepository.dart';
import 'package:flutter/cupertino.dart';

class CompanyController extends ChangeNotifier {
  CompanyRepository compRepository = CompanyRepository();
  bool _isLoading = false;
  bool get loading => _isLoading;
  List<Company> _companies = [];
  Company company = Company();

  List<Company> get companies => _companies;

  Future<void> GetCompnies() async {
    _isLoading = true;
    _companies = [];
    var response = await compRepository.gettingComp();
    var decodedData = jsonDecode(response.body);
    for (var m in decodedData['data']) {
      companies.add(Company.fromJson(m));
    }
    _isLoading = false;
    notifyListeners();
  }
}
