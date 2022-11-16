import 'dart:io';

import 'package:checkapp/CompanyDetails.dart';
import 'package:checkapp/controller.dart';
import 'package:checkapp/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Controller controller = Controller();

  @override
  void tryLogin(String email, String password) async {
    try {
      var response = await controller.login(email, password);
      print("yahan tk agya hai page mai: s${response}");
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 248, 247, 246),
        actions: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "WANT TO SEE THE REVIEWS",
                  style:
                      TextStyle(color: Color(0xff0A66C2), fontFamily: 'Anton'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                  tooltip: "read review",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompanyDetails(),
                      ),
                    );
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
        titleSpacing: 50,
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
                              tryLogin(emailController.text,
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
