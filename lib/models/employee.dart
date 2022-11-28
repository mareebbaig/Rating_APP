class Employee {
  final String? username;
  final String? review;
  final String? employeeId;
  final String? rating;

  Employee({this.username, this.employeeId, this.review, this.rating});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      username: json['username'],
      review: json['review'],
      rating: json['rating'],
    );
  }
}
