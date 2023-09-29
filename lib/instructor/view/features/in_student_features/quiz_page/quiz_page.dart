import 'package:attendance_app/instructor/view/features/in_student_features/quiz_page/widgets/quiz_card.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: List.generate(6, (index) => QuizCard(index: index + 1)),
          ),
        ),
      ),
    );
  }
}
