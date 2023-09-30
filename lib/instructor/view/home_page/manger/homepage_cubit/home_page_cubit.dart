import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../model/student_model.dart';
import '../../../../shared/shared.dart';



part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  static HomePageCubit get(context) => BlocProvider.of(context);
  List<StudentModel>sharedStudents=[];
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

  String? coursesDropDownMenuValue;

  void changeCoursesDropDownMenuValue(String newValue) {
    coursesDropDownMenuValue = newValue;
    emit(ChangeCoursesDropDownMenuValue());
  }
  void getCourseStudents(
      {required String courseName})async{
    sharedStudents =[];
    emit(GetAllCourseStudents());
    await FirebaseFirestore.instance.collection(courseName).get()
        .then((value) {
      for (var element in value.docs) {
        element.reference.collection("students").get().then((value) {
          for (var element in value.docs) {
            sharedStudents.add(StudentModel.fromJson(element.data()));

          }
          emit(GetAllCourseStudents());
        });
      }
    });
  }
}
