import 'package:flutter/material.dart';

class GradesPage extends StatelessWidget {
  final String studentName;
  final String quiz;
  final String attendance;
  final String assignment;
  final String project1;
  final String project2;
  final String finalProject;

  const GradesPage({
    super.key,
    required this.studentName,required this.quiz,required this.attendance,
    required this.project2,required this.project1,required this.finalProject,required this.assignment
  });

  @override
  Widget build(BuildContext context) {
    final double textHeight = (((MediaQuery.of(context).size.height * 0.8) / 8));
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Center(
              child: Text(
                'Name : $studentName',
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            margin: const EdgeInsets.all(0),
            child: Center(
              child: Table(
                border: TableBorder.all(color: Colors.white),
                children: [
                  TableRow(children: [
                    SizedBox(
                      height: textHeight,
                      child: const Center(
                          child: Text(
                        'Field',
                      )),
                    ),
                    SizedBox(
                      height: textHeight,
                      child: const Center(
                          child: Text(
                        'Grade',
                      )),
                    ),
                  ]),
                  TableRow(children: [
                    SizedBox(
                      height: textHeight,
                      child: const Center(
                          child: Text(
                        'Assignment',
                      )),
                    ),
                    SizedBox(
                      height: textHeight,
                      child:  Center(
                          child: Text(
                        assignment,
                      )),
                    ),
                  ]),
                  TableRow(children: [
                    SizedBox(
                      height: textHeight,
                      child: const Center(
                          child: Text(
                        'Attendance',
                      )),
                    ),
                    SizedBox(
                      height: textHeight,
                      child:  Center(
                          child: Text(attendance
                        ,
                      )),
                    ),
                  ]),
                  TableRow(children: [
                    SizedBox(
                      height: textHeight,
                      child: const Center(
                          child: Text(
                        'Quiz',
                      )),
                    ),
                    SizedBox(
                      height: textHeight,
                      child:  Center(
                          child: Text(
                       quiz,
                      )),
                    ),
                  ]),
                  TableRow(children: [
                    SizedBox(
                      height: textHeight,
                      child: const Center(
                          child: Text(
                        'Project 1',
                      )),
                    ),
                    SizedBox(
                      height: textHeight,
                      child:  Center(
                          child: Text(
                        project1,
                      )),
                    ),
                  ]),
                  TableRow(children: [
                    SizedBox(
                      height: textHeight,
                      child: const Center(
                          child: Text(
                        'Project 2',
                      )),
                    ),
                    SizedBox(
                      height: textHeight,
                      child:  Center(
                          child: Text(
                        project2,
                      )),
                    ),
                  ]),
                  TableRow(children: [
                    SizedBox(
                      height: textHeight,
                      child: const Center(
                          child: Text(
                        'Final Project',
                      )),
                    ),
                    SizedBox(
                      height: textHeight,
                      child:  Center(
                          child: Text(
                        finalProject,
                      )),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
