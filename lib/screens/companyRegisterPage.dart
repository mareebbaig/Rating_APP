// ignore_for_file: use_build_context_synchronously
import 'package:checkapp/screens/InsertreviewPage.dart';
import 'package:checkapp/screens/companiesPage.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../controller/userController.dart';

class CompanyDetails extends StatefulWidget {
  final UserController? user;
  CompanyDetails({super.key, required this.user});

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  void _failSnackbar(String error) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        error,
        textAlign: TextAlign.center,
        style: TextStyle(),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _tryRegisterCompany(String companyName, String city) async {
    try {
      var response =
          await widget.user!.tryRegisterCompany(companyName, city, widget.user);
      if (response == 200) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     // builder: (context) => InsertReviewPage(user: widget.user),
        //   ),
        // );
      } else if (response == '23505') {
        _failSnackbar('Company has already been registerd');
      } else if (response == '23503') {
        _failSnackbar("no user registerd");
      }
    } catch (e) {
      _failSnackbar(e.toString());
    }
  }

  TextEditingController companyNameController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 248, 247, 246),
        automaticallyImplyLeading: false,
        titleSpacing: 20,
        title: const Text(
          "Review US",
          style: TextStyle(
            color: Color(0xff0A66C2),
            fontFamily: 'Anton',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: Form(
                key: _formkey,
                child: Card(
                  elevation: 20,
                  child: Container(
                    height: 400,
                    width: 450,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 248, 247, 246),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text(
                            "Company Details",
                            style: TextStyle(
                              color: Color(0xff0A66C2),
                              fontSize: 30.0,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.5,
                              height: 2.00,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Company Name'),
                            controller: companyNameController,
                            validator: RequiredValidator(errorText: ""),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: TextFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'City'),
                              controller: cityController,
                              validator: RequiredValidator(errorText: "")),
                        ),
                        Center(
                          child: SizedBox(
                            height: 50,
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formkey.currentState?.validate() == true) {
                                  _tryRegisterCompany(
                                    companyNameController.text,
                                    cityController.text,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff0A66C2),
                                elevation: 10,
                              ),
                              child: const Text(
                                "Continue",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.5,
                                  //height: 2.00,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
