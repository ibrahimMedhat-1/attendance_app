import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_quizzes_state.dart';

class EditQuizzesCubit extends Cubit<EditQuizzesState> {
  EditQuizzesCubit() : super(EditQuizzesInitial());
  static EditQuizzesCubit get(context) => BlocProvider.of(context);

  List<DropdownMenuItem<String>> quizCourses = const [
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
  String? quizCoursesDropDownMenuValue;

  void changeQuizCoursesDropDownMenuValue(String newValue) {
    quizCoursesDropDownMenuValue = newValue;
    emit(ChangeQuizCoursesDropDownMenuValue());
  }
}
