import 'package:attendance_app/instructor/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  static HomePageCubit get(context) => BlocProvider.of(context);
  List<DropdownMenuItem<String>> courses = const [
    DropdownMenuItem(
      value: 'Flutter Beginner',
      child: Text('Flutter Beginner'),
    ),
    DropdownMenuItem(
      value: 'Flutter Advanced',
      child: Text('Flutter Advanced'),
    ),
    DropdownMenuItem(
      value: 'Data Structure',
      child: Text('Data Structure'),
    ),
    DropdownMenuItem(
      value: 'Object Oriented Programming',
      child: Text('Object Oriented Programming'),
    ),
  ];
  List<StudentModel> students = [
    StudentModel(
        name: 'ibrahim',
        email: 'Ibrahimmedhat112@gmail.com',
        phoneNo: '01064172976',
        profilePicture: 'assets/profilePic.jpeg',
        attendance: 0,
        absence: 24,
        totalGrades: 48),
    StudentModel(
        name: 'mahmoud',
        email: 'mahmopuahendmoha112@gmail.com',
        phoneNo: '01064172976',
        profilePicture: 'assets/profilePic.jpeg',
        attendance: 3,
        absence: 3,
        totalGrades: 48),
    StudentModel(
        name: 'kahleddfghjkljhgfdfsghjkl;jhgf',
        email: 'Ibrahdrfhgjkhgfdxgchjkimmedhat112@gmail.com',
        phoneNo: '01064172976',
        profilePicture: 'assets/profilePic.jpeg',
        attendance: 3,
        absence: 3,
        totalGrades: 48),
    StudentModel(
        name: 'drgfhjklhgf',
        email: 'ghjkljnhbvgcf@gmail.com',
        phoneNo: '01064172976',
        profilePicture: 'assets/profilePic.jpeg',
        attendance: 3,
        absence: 3,
        totalGrades: 48),
  ];
  String? coursesDropDownMenuValue;

  void changeCoursesDropDownMenuValue(String newValue) {
    coursesDropDownMenuValue = newValue;
    emit(ChangeCoursesDropDownMenuValue());
  }
}
