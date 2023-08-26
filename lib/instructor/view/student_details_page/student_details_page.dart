import 'package:attendance_app/instructor/model/student_model.dart';
import 'package:attendance_app/instructor/view/assignment_page/assignment_page.dart';
import 'package:attendance_app/instructor/view/attendance_page/attendance_page.dart';
import 'package:attendance_app/instructor/view/grades_page/grades_page.dart';
import 'package:attendance_app/instructor/view/quiz_page/quiz_page.dart';
import 'package:attendance_app/instructor/view/student_details_page/student_details_widgets/default_button.dart';
import 'package:attendance_app/instructor/view_model/student_details_cubit/student_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentDetails extends StatelessWidget {
  final StudentModel student;

  const StudentDetails({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentDetailsCubit(),
      child: BlocConsumer<StudentDetailsCubit, StudentDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          StudentDetailsCubit cubit = StudentDetailsCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(student.profilePicture!),
                        radius: MediaQuery.of(context).size.width * 0.25,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name : ${student.name}',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    'Email :',
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        cubit.launch(url: 'mailto:${student.email}');
                                      },
                                      child: Text(
                                        student.email!,
                                        overflow: TextOverflow.ellipsis,
                                        // style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Phone : ${student.phoneNo}',
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
                                ),
                                IconButton(
                                    onPressed: () {
                                      cubit.launch(url: 'tel:${student.phoneNo}');
                                    },
                                    icon: Icon(
                                      Icons.phone,
                                      size: MediaQuery.of(context).size.width * 0.07,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      cubit.launch(url: 'https://wa.me/2${student.phoneNo}?text=');
                                    },
                                    icon: ImageIcon(
                                      const AssetImage('assets/whatsapp.png'),
                                      color: Colors.green,
                                      size: MediaQuery.of(context).size.width * 0.07,
                                    )),
                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                            DefaultButton(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (builder) => const AttendancePage()));
                                },
                                text: 'Attendance'),
                            DefaultButton(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (builder) => const AssignmentPage()));
                                },
                                text: 'Assignments'),
                            DefaultButton(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (builder) => const QuizPage()));
                                },
                                text: 'Quizzes'),
                            DefaultButton(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (builder) => GradesPage(studentName: student.name!)));
                                },
                                text: 'Grades'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
