import 'package:flutter/material.dart';

import '../view/assignment_page/assignment_page.dart';
import '../view/home_page/view/student_home_page.dart';
import '../view/quiz_page/quiz_page.dart';
import '../view/sessions_page/sessions_page.dart';

class StudentLayOut extends StatelessWidget {
  const StudentLayOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.white,
            isScrollable: true,
            labelStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.04,
            ),
            tabs: const [
              Tab(text: "Home"),
              Tab(text: "Sessions"),
              Tab(text: "Quizzes"),
              Tab(text: "Assignments"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            StudentHomePage(),
            Sessions(),
            QuizPageStudent(),
            AssignmentPageStudent(),
          ],
        ),
      ),
    );
  }
}
