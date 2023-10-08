import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../edit_assignments/edit_assignments.dart';
import '../../edit_quizzes/edit_quizzes.dart';
import '../../edit_sessions/edit_session_page.dart';

part 'edit_page_state.dart';

class EditPageCubit extends Cubit<EditPageState> {
  EditPageCubit() : super(EditPageInitial());

  static EditPageCubit get(context) => BlocProvider.of(context);

  List<Widget> editPage = const [
    EditSessionPage(),
    EditAssignments(),
    EditQuizzes(),
  ];
  int editPageIndex = 0;

  void changeEditPageIndex(index) {
    editPageIndex = index;
    emit(ChangeEditPageIndex());
  }
}
