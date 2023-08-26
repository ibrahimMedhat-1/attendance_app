import 'package:attendance_app/instructor/view/attendance_page/attendance_page_card/attendance_page_card.dart';
import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                    24,
                    (index) => AttendanceCard(
                          index: index + 1,
                        )),
              ),
            ),
            Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  'Total Attendance : 0',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  'Total Absence : 24',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
