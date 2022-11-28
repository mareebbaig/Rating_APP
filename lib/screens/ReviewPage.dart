import 'package:checkapp/controller/employeeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ReadReviewPage extends StatelessWidget {
  const ReadReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 248, 247, 246),
        automaticallyImplyLeading: false,
        titleSpacing: 20,
        title: const Text(
          "Employee Reviews",
          style: TextStyle(
            color: Color(0xff0A66C2),
            fontFamily: 'Anton',
          ),
        ),
      ),
      body: Consumer<EmployeeController>(
        builder: (context, provider, _) {
          if (!provider.loading) {
            return ListView.builder(
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              itemCount: provider.employee.length,
              itemBuilder: ((BuildContext context, index) {
                return ReviewCard(
                  empname: provider.employee[index].username,
                  review: provider.employee[index].review,
                  rating: provider.employee[index].rating,
                );
              }),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String? empname;
  final String? review;
  final String? rating;
  const ReviewCard({
    Key? key,
    required this.empname,
    required this.review,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 200,
          width: 300,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Color.fromARGB(255, 248, 247, 246),
          ),
          child: Column(
            children: [
              Container(
                height: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  color: Color(0xff0A66C2),
                ),
                child: Center(
                  child: Text(
                    empname!,
                    style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 248, 247, 246)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  review!,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    //height: 2.00,
                  ),
                ),
              ),
              RatingBarIndicator(
                rating: double.parse(rating!),
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: const Color(0xff0A66C2),
                ),
                itemCount: 5,
                direction: Axis.horizontal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
