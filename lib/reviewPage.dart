import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 248, 247, 246)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                height: 600,
                width: 500,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "Insert the review for your company's employees",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Anton',
                          fontSize: 30.0,
                          height: 2.00,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Enter Employee Name",
                        style: TextStyle(
                          color: Color.fromARGB(255, 90, 96, 101),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w200,
                          letterSpacing: 0.5,
                          height: 2.00,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        // controller: emailController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Enter Review",
                        style: TextStyle(
                          color: Color.fromARGB(255, 90, 96, 101),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w200,
                          letterSpacing: 0.5,
                          height: 2.00,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        //controller: emailController,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => CompanyDetails()),
                                  // );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff0A66C2),
                                  elevation: 10,
                                ),
                                child: const Text(
                                  "POST REVIEW",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                    //height: 2.00,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
