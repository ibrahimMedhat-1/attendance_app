import 'package:flutter/material.dart';

class GradesPage extends StatelessWidget {
  final String studentName;

  const GradesPage({
    super.key,
    required this.studentName,
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
                      child: const Center(
                          child: Text(
                        '20',
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
                      child: const Center(
                          child: Text(
                        '24',
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
                      child: const Center(
                          child: Text(
                        '6',
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
                      child: const Center(
                          child: Text(
                        '20',
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
                      child: const Center(
                          child: Text(
                        '30',
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
                      child: const Center(
                          child: Text(
                        '100',
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
