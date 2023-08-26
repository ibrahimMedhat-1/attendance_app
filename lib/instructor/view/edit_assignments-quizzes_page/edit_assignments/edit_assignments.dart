import 'package:attendance_app/instructor/view_model/edit_assignments-quizzes_cubit/edit_assignments_cubit/edit_assignments_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'assignment_page_card/assignment_page_card.dart';

class EditAssignments extends StatelessWidget {
  const EditAssignments({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditAssignmentsCubit(),
      child: BlocConsumer<EditAssignmentsCubit, EditAssignmentsState>(
        listener: (context, state) {},
        builder: (context, state) {
          EditAssignmentsCubit cubit = EditAssignmentsCubit.get(context);
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    itemHeight: MediaQuery.of(context).size.width * 0.1 < 48 ? kMinInteractiveDimension : MediaQuery.of(context).size.width * 0.1,
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
                      (index) => EditAssignmentCard(
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
