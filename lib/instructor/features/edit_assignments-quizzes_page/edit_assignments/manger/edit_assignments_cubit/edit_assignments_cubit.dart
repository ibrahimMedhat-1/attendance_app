import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_assignments_state.dart';

class EditAssignmentsCubit extends Cubit<EditAssignmentsState> {
  EditAssignmentsCubit() : super(EditAssignmentsInitial());
  static EditAssignmentsCubit get(context) => BlocProvider.of(context);

  List<DropdownMenuItem<String>> assignmentCourses = const [
    DropdownMenuItem(
      value: 'FlutterBeginner',
      child: Text('Flutter Beginner'),
    ),
    DropdownMenuItem(
      value: 'FlutterAdvanced',
      child: Text('Flutter Advanced'),
    ),
    DropdownMenuItem(
      value: 'DataStructure',
      child: Text('Data Structure'),
    ),
    DropdownMenuItem(
      value: 'ObjectOrientedProgramming',
      child: Text('Object Oriented Programming'),
    ),
  ];
  String? assignmentCoursesDropDownMenuValue;

  void changeQuizCoursesDropDownMenuValue(String newValue) {
    assignmentCoursesDropDownMenuValue = newValue;
    emit(ChangeAssignmentCoursesDropDownMenuValue());
  }
}
