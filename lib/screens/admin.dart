import 'package:checkapp/controller/employeeController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<EmployeeController>(
        builder: (context, provider, _) {
          if (!provider.loading) {
            return Table(
              border: TableBorder.all(color: Color(0)),
              children: List<TableRow>.generate(
                provider.employee.length,
                (index) {
                  final emp = provider.employee[index];
                  return TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(emp.username.toString(),
                            textAlign: TextAlign.center),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(emp.review.toString(),
                            textAlign: TextAlign.center),
                      ),
                    ],
                  );
                },
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
