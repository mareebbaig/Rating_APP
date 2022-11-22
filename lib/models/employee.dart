class Employee {
  final String? username;
  final String? review;
  final String? employeeId;

  Employee({this.username, this.employeeId, this.review});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(username: json['username'], review: json['review']);
  }
}
