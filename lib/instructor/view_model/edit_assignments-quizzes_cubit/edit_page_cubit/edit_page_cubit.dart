import 'package:attendance_app/instructor/view/edit_assignments-quizzes_page/edit_assignments/edit_assignments.dart';
import 'package:attendance_app/instructor/view/edit_assignments-quizzes_page/edit_quizzes/edit_quizzes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_page_state.dart';

class EditPageCubit extends Cubit<EditPageState> {
  EditPageCubit() : super(EditPageInitial());

  static EditPageCubit get(context) => BlocProvider.of(context);

  List<Widget> editPage = const [
    EditAssignments(),
    EditQuizzes(),
  ];
  int editPageIndex = 0;

  void changeEditPageIndex(index) {
    editPageIndex = index;
    emit(ChangeEditPageIndex());
  }
}
