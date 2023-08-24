import 'package:attendance_app/instructor/model/student_model.dart';
import 'package:flutter/material.dart';

import '../../student_details_page/student_details_page.dart';

class AnimationList extends StatefulWidget {
  final List<StudentModel> studentsModel;

  const AnimationList({
    super.key,
    required this.studentsModel,
  });

  @override
  State<AnimationList> createState() => _AnimationListState();
}

class _AnimationListState extends State<AnimationList> with SingleTickerProviderStateMixin {
  // late AnimationController animationController;
  // late Animation animation;
  ScrollController scrollController = ScrollController();
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List<Widget> studentTileList = [];

  Widget studentTile(StudentModel student) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('${student.profilePicture}'),
              radius: MediaQuery.of(context).size.width * 0.1,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name : ${student.name}',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  Text(
                    'Attendance : ${student.attendance}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  Text(
                    'Absence : ${student.absence}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  Text(
                    'Total grades : ${student.totalGrades}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  void addStudent() async {
    for (var student in widget.studentsModel) {
      // animationController.forward();
      await Future.delayed(const Duration(milliseconds: 200)).then((value) {});
      studentTileList.add(studentTile(student));
      listKey.currentState!.insertItem(studentTileList.length - 1);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addStudent();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: listKey,
      controller: scrollController,
      itemBuilder: (context, index, animation) {
        animation.addListener(() {
          setState(() {});
        });
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 370),
          opacity: Tween<double>(begin: 0, end: 1).evaluate(animation),
          child: SlideTransition(
            position: animation.drive(Tween(begin: const Offset(1, 0), end: const Offset(0, 0))),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => StudentDetails(student: widget.studentsModel[index])));
              },
              child: studentTileList[index],
            ),
          ),
        );
      },
      initialItemCount: studentTileList.length,
    );
  }
}