class StudentModel {
  String? name;
  String? email;
  String? phoneNo;
  String? profilePicture;
  int? attendance;
  int? assignment;
  int? absence;
  int? totalGrades;
  String? courseName;
  String? courseDate;
  int? finalProject;
  int? project1;
  int? project2;

  StudentModel({required this.name,
    required this.email,
    required this.phoneNo,
    required this.profilePicture,
    required this.attendance,
    required this.absence,
    required this.totalGrades,
    required this.courseName,
    required this.courseDate,
    required this.assignment,
    required this.finalProject,
    required this.project1,
    required this.project2
  });

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
    assignment = json['assignment'];
    finalProject = json['finalProject'];
    project1 = json['project1'];
    project2 = json['project2'];
  }

  Map<String, dynamic> toMap({required id}) =>
      {
        'name': name,
        'email': email,
        'phoneNo': phoneNo,
        'profilePicture': profilePicture,
        'absence': absence,
        'courseName': courseName,
        'courseDate': courseDate,
        'id': id,

      };

  Map<String, dynamic> gradesToMap() =>
      {
        'finalProject': finalProject,
        'assignment': assignment,
        'project1': project1,
        'project2': project2,
        'totalGrades': totalGrades,
        'attendance': attendance,
      };
}
