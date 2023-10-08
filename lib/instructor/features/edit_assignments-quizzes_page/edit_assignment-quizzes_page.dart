
import 'package:attendance_app/instructor/features/edit_assignments-quizzes_page/selecting_row_animation/selecting_row_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manger/edit_page_cubit/edit_page_cubit.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditPageCubit(),
      child: BlocConsumer<EditPageCubit, EditPageState>(
        listener: (context, state) {},
        builder: (context, state) {
          EditPageCubit cubit = EditPageCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.all(20), child: SelectAnimation()),
                  const SizedBox(height: 20),
                  Expanded(
                    child: cubit.editPage[cubit.editPageIndex],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
