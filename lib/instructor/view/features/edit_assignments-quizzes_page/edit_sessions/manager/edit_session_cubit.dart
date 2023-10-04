import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_session_state.dart';

class EditSessionCubit extends Cubit<EditSessionState> {
  EditSessionCubit() : super(EditSessionInitial());
  static EditSessionCubit get(context) => BlocProvider.of(context);
  List<DropdownMenuItem<String>> assignmentCourses = const [
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
  String? assignmentCoursesDropDownMenuValue;

  void changeQuizCoursesDropDownMenuValue(String newValue) {
    assignmentCoursesDropDownMenuValue = newValue;
    emit(ChangeAssignmentCoursesDropDownMenuValue());
  }
}
