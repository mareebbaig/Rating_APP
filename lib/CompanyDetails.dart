import 'package:checkapp/reviewPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CompanyDetails extends StatelessWidget {
  CompanyDetails({super.key});
  TextEditingController companyNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();

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
                        child: TextField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Company Name'),
                          controller: companyNameController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: TextField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(), hintText: 'City'),
                          controller: cityController,
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: 50,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
