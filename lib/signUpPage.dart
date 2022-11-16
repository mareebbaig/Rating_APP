import 'package:checkapp/CompanyDetails.dart';
import 'package:checkapp/loginPage.dart';
import 'package:checkapp/reviewPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
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
                        builder: (context) => ReviewPage(),
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
                  height: 500,
                  width: 500,
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
                          "SignUp",
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
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Username'),
                          controller: usernameController,
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CompanyDetails()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff0A66C2),
                              elevation: 10,
                            ),
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.5,
                                //height: 2.00,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: const [
                          Expanded(
                            child: Divider(
                              indent: 20.0,
                              endIndent: 10.0,
                              thickness: 1.5,
                            ),
                          ),
                          Text(
                            "OR",
                            style: TextStyle(color: Color(0xff0A66C2)),
                          ),
                          Expanded(
                            child: Divider(
                              indent: 10.0,
                              endIndent: 20.0,
                              thickness: 1.5,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "SignIn",
                              style: TextStyle(
                                color: Color(0xff0A66C2),
                              ),
                            ),
                          ),
                        ],
                      ),
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
