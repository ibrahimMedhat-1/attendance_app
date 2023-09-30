class StudentModel {
  String? name;
  String? email;
  String? phoneNo;
  String? profilePicture;
  int? attendance;
  int? absence;
  int? totalGrades;
  String? courseName;
  String? courseDate;

  StudentModel(
      {required this.name,
      required this.email,
      required this.phoneNo,
      required this.profilePicture,
      required this.attendance,
      required this.absence,
      required this.totalGrades,
      required this.courseName,
      required this.courseDate});

  StudentModel.fromJson(Map<String, dynamic>? json) {
    name = json!['name'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    profilePicture = json['profilePicture'];
    attendance = json['attendance'];
    absence = json['absence'];
    totalGrades = json['totalGrades'];
    courseName = json['courseName'];
    courseDate = json['courseDate'];
  }

  Map<String, dynamic> toMap({required id}) => {
        'name': name,
        'email': email,
        'phoneNo': phoneNo,
        'profilePicture': profilePicture,
        'attendance': attendance,
        'absence': absence,
        'totalGrades': totalGrades,
        'courseName': courseName,
        'courseDate': courseDate,
        'id': id
      };
}
