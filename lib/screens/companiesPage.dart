import 'package:checkapp/controller/companyController.dart';
import 'package:checkapp/controller/employeeController.dart';
import 'package:checkapp/models/company.dart';
import 'package:checkapp/screens/ReviewPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompaniesPage extends StatelessWidget {
  CompaniesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Select Company",
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
                height: 2.00,
              ),
            ),
          ),
          Consumer<CompanyController>(
            builder: (context, provider, _) {
              if (!provider.loading) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.companies.length,
                  itemBuilder: ((BuildContext context, index) {
                    return CompanyNameButton(
                        company: provider.companies[index]);
                  }),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }
}

class CompanyNameButton extends StatelessWidget {
  //final String? companyName;
  final Company company;
  const CompanyNameButton({
    Key? key,
    required this.company,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('ide ${company.companyName}');
    return TextButton(
      onPressed: () async {
        await context.read<EmployeeController>().getEmployees(company.compId!);
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReadReviewPage(),
          ),
        );
        //  tryGettingComp(context);
      },
      child: Text(
        company.companyName!,
        style: const TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.5,
          //height: 2.00,
        ),
      ),
    );
  }
}
