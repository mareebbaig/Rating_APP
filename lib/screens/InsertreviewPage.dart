import 'package:checkapp/controller/userController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class InsertReviewPage extends StatefulWidget {
  // final UserController? user  required this.user;
  const InsertReviewPage({
    super.key,
  });

  @override
  State<InsertReviewPage> createState() => _InsertReviewPageState();
}

class _InsertReviewPageState extends State<InsertReviewPage> {
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

  // void _tryInsertReview(
  //     String empName, String review, double ratingController) async {
  //   try {
  //     var response = await widget.user?.tryInsertingReview(
  //         widget.user, empName, review, ratingController.toString());
  //     if (response == 200) {
  //       _failSnackbar('Review posted');
  //     }
  //   } catch (e) {
  //     _failSnackbar(e.toString());
  //   }
  // }

  TextEditingController empNameController = TextEditingController();

  TextEditingController reviewController = TextEditingController();

  double ratingController = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 248, 247, 246)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                height: 600,
                width: 500,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "First Name",
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
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                        // controller: empNameController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Last Name",
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
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                        //controller: empNameController,
                      ),
                      const Text(
                        "email",
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
                      ),
                      const Text(
                        "Passport",
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
                      ),
                      const Text(
                        "National ID",
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
                      ),
                      const Text(
                        "Organization",
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
                      ),
                      const Text(
                        "Submitted By",
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
                      ),
                      const Text(
                        "Phone / Mobile",
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
                      ),
                      const Text(
                        "Reason of submission",
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
                      ),
                      const Text(
                        "Submission Title",
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
                      ),
                      const Text(
                        "Submission Description",
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
                      ),
                      const Text(
                        "Phone",
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
                      ),
                      const Text(
                        "email",
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
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: const Color(0xff0A66C2),
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            ratingController = rating;
                          });
                        },
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
                                  // if (empNameController.text != '' &&
                                  //     reviewController.text != '') {
                                  //   _tryInsertReview(
                                  //       empNameController.text,
                                  //       reviewController.text,
                                  //       ratingController);

                                  //   empNameController.clear();
                                  //   reviewController.clear();
                                  // }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff0A66C2),
                                  elevation: 10,
                                ),
                                child: const Text(
                                  "POST",
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
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
