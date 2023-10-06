class instructorModel{
  String? name;
  String? email;
  instructorModel({required this.email,required this.name});
  instructorModel.fromJson(Map<String, dynamic>? json) {
    name = json!['name'];
    email = json['email'];
  }
  Map<String, dynamic> toMap({required id}) =>
      {
        'name': name,
        'email': email,
      };
}