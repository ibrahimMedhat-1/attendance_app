import 'package:attendance_app/instructor/view/features/edit_assignments-quizzes_page/edit_sessions/manager/edit_session_cubit.dart';
import 'package:attendance_app/instructor/view/features/edit_assignments-quizzes_page/edit_sessions/widgets/session_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditSessionPage extends StatelessWidget {
  const EditSessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditSessionCubit(),
      child: BlocConsumer<EditSessionCubit, EditSessionState>(
        listener: (context, state) {},
        builder: (context, state) {
          EditSessionCubit cubit = EditSessionCubit.get(context);
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    itemHeight: MediaQuery.of(context).size.width * 0.1 < 48
                        ? kMinInteractiveDimension
                        : MediaQuery.of(context).size.width * 0.1,
                    value: cubit.assignmentCoursesDropDownMenuValue,
                    items: cubit.assignmentCourses,
                    dropdownColor: Colors.black,
                    style: Theme.of(context).textTheme.bodyMedium,
                    onChanged: (value) {
                      cubit.changeQuizCoursesDropDownMenuValue(value!);
                    },
                    hint: Text(
                      'Choose your course',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              Text(cubit.assignmentCoursesDropDownMenuValue.toString()),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                      20,
                      (index) => EditSessionCard(
                            index: index + 1,
                          )),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
