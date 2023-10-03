import 'package:attendance_app/instructor/view/home_page/manger/homepage_cubit/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/student_model.dart';
import '../../features/in_student_features/student_details_page/student_details_page.dart';

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
            student.profilePicture== ''? CircleAvatar( backgroundImage: const AssetImage('assets/profile.jpg'),radius: MediaQuery.of(context).size.width * 0.1,)
            :CircleAvatar( backgroundImage:NetworkImage("${student.profilePicture}"),radius: MediaQuery.of(context).size.width * 0.1,),

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
      await Future.delayed(const Duration(milliseconds: 200)).then((value) {});
      studentTileList.add(studentTile(student));
      listKey.currentState!.insertItem(studentTileList.length -1);
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
  listener: (context, state) {
    if(state is ClearStudentsList){
      setState(() {
        studentTileList =[];
        listKey.currentState!.removeAllItems((context, animation) {
          return const SizedBox();
        });
      });
    }
    if(state is GetAllCourseStudents){
      setState(() {
        addStudent();
      });
    }
  },
  builder: (context, state) {
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => StudentDetails(student: widget.studentsModel[index])));
              },
              child: studentTileList[index],
            ),
          ),
        );
      },
      initialItemCount: studentTileList.length,
    );
  },
);
  }
}
