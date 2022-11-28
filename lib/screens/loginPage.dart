import 'package:checkapp/controller/userController.dart';
import 'package:checkapp/screens/companiesPage.dart';
import 'package:flutter/material.dart';
import '../controller/companyController.dart';
import 'package:provider/provider.dart';

UserController user = UserController();

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

  void _tryLogin(String email, String password) async {
    try {
      var response = await user.tryLogin(email, password);
      if (response['code'] == 200) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => InsertReviewPage(user: user),
        //   ),
        // );
      } else if (response['code'] == 500) {
        _failSnackbar(response['error']);
      }
    } catch (e) {
      _failSnackbar(e.toString());
    }
  }

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 248, 247, 246),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                  tooltip: "read review",
                  onPressed: () async {
                    await context.read<CompanyController>().GetCompnies();
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompaniesPage(),
                      ),
                    );
                    //tryGettingComp(context);
                  },
                  icon: const Icon(
                    Icons.rate_review_outlined,
                    color: Color(0xff0A66C2),
                  ),
                ),
              ),
            ],
          ),
        ],
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
                          "SignIn",
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
                        child: TextField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(), hintText: 'Email'),
                          controller: emailController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: TextField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Password'),
                          controller: passwordController,
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: 50,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              _tryLogin(emailController.text,
                                  passwordController.text);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff0A66C2),
                              elevation: 10,
                            ),
                            child: const Text(
                              "SignIn",
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
          ],
        ),
      ),
    );
  }
}
