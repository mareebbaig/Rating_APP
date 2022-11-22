class Company {
  final String? companyName;
  final String? compId;

  Company({this.companyName, this.compId});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(companyName: json['company_name'], compId: json['compid']);
  }
}
