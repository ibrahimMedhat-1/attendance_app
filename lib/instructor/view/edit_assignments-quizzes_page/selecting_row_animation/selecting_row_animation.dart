import 'package:attendance_app/instructor/view_model/edit_assignments-quizzes_cubit/edit_page_cubit/edit_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectAnimation extends StatefulWidget {
  const SelectAnimation({super.key});

  @override
  State<SelectAnimation> createState() => _SelectAnimationState();
}

class _SelectAnimationState extends State<SelectAnimation> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animation = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(1, 0)).animate(animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditPageCubit, EditPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        EditPageCubit cubit = EditPageCubit.get(context);
        return Stack(
          children: [
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) => child!,
              child: SlideTransition(
                position: animation,
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 50,
                  width: (MediaQuery.of(context).size.width / 2) - 30,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    animationController.reverse();
                    animationController.addStatusListener((status) {
                      if (status == AnimationStatus.dismissed) {
                        cubit.changeEditPageIndex(0);
                      }
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 50,
                    width: (MediaQuery.of(context).size.width / 2) - 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Assignments',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    animationController.forward();
                    animationController.addStatusListener((status) {
                      if (status == AnimationStatus.completed) {
                        cubit.changeEditPageIndex(1);
                      }
                    });
                  },
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.only(right: 10),
                    width: (MediaQuery.of(context).size.width / 2) - 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Quizzes',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
