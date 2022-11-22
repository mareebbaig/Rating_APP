import 'package:http/http.dart' as http;
import 'dart:convert';

class EmployeeRepository {
  Future<dynamic> getEmployees(String compId) async {
    try {
      var response = await http.post(
        Uri.parse("http://192.168.3.150:3500/v1/getReview"),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
        body: jsonEncode(
          <String, String>{
            'compId': compId,
          },
        ),
      );
      return response;
    } catch (e) {
      print(e);
    }
  }
}
