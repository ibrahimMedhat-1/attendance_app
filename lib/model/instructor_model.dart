class InstructorModel {
  String? name;
  String? email;
  InstructorModel({required this.email, required this.name});
  InstructorModel.fromJson(Map<String, dynamic>? json) {
    name = json!['name'];
    email = json['email'];
  }
  Map<String, dynamic> toMap({required id}) => {
        'name': name,
        'email': email,
      };
}
