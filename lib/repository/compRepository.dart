import 'dart:convert';
import 'package:http/http.dart' as http;

class CompanyRepository {
  Future<dynamic> gettingComp() async {
    try {
      var response = await http.get(
        Uri.parse("http://192.168.3.150:3500/v1/getCompnies"),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
      );
      return response;
    } catch (e) {
      print(e);
    }
  }
}
