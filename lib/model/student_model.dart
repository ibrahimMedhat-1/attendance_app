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

  StudentModel.fromJson(Map<String, dynamic>? data, Map<String, dynamic>? grades) {
    name = data!['name'];
    email = data['email'];
    phoneNo = data['phoneNo'];
    profilePicture = data['profilePicture'];
    absence = data['absence'];
    courseName = data['courseName'];
    courseDate = data['courseDate'];
    finalProject = grades!['finalProject'];
    assignment = grades['assignment'];
    project1 = grades['project1'];
    project2 = grades['project2'];
    totalGrades = grades['totalGrades'];
    attendance = grades['attendance'];
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
