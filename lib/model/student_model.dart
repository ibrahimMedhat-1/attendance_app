class StudentModel {
  String? name;
  String? email;
  String? phoneNo;
  String? profilePicture;
  int? attendance;
  int? absence;
  int? totalGrades;

  StudentModel({
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.profilePicture,
    required this.attendance,
    required this.absence,
    required this.totalGrades,
  });

  StudentModel.fromJson(Map<String, dynamic>? json) {
    name = json!['name'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    profilePicture = json['profilePicture'];
    attendance = json['attendance'];
    absence = json['absence'];
    totalGrades = json['totalGrades'];
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
        'phoneNo': phoneNo,
        'profilePicture': profilePicture,
        'attendance': attendance,
        'absence': absence,
        'totalGrades': totalGrades,
      };
}
