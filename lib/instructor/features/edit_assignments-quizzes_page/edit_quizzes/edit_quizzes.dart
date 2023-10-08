import 'package:attendance_app/instructor/features/edit_assignments-quizzes_page/edit_quizzes/widgets/quiz_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manger/edit_quizzes_cubit/edit_quizzes_cubit.dart';

class EditQuizzes extends StatelessWidget {
  const EditQuizzes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditQuizzesCubit(),
      child: BlocConsumer<EditQuizzesCubit, EditQuizzesState>(
        listener: (context, state) {},
        builder: (context, state) {
          EditQuizzesCubit cubit = EditQuizzesCubit.get(context);
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
                    value: cubit.quizCoursesDropDownMenuValue,
                    items: cubit.quizCourses,
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
              Text(cubit.quizCoursesDropDownMenuValue.toString()),
              Expanded(
                child: Column(
                  children: List.generate(6, (index) => EditQuizCard(index: index + 1)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
