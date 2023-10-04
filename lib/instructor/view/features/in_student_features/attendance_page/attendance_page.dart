import 'package:flutter/material.dart';

import 'widgets/attendance_page_card.dart';

class AttendancePage extends StatelessWidget {
   const AttendancePage({super.key,required this.attendance,required this.absence});
  final String attendance;
  final String absence;

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
                  'Total Attendance : $attendance',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  'Total Absence : $absence',
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
