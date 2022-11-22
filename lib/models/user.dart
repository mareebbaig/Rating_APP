class User {
  final String? username;
  final String? email;
  final String? userId;
  final String? city;
  final String? company;
  String? compId;

  User(
      {this.email,
      this.username,
      this.userId,
      this.compId,
      this.company,
      this.city});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['email'],
        username: json['username'],
        userId: json['userid'],
        city: json['city'],
        company: json['company_name'],
        compId: json['compid']);
  }
}
