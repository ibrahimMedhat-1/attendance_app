import 'package:flutter/material.dart';

class AttendanceCard extends StatefulWidget {
  final int index;

  const AttendanceCard({
    super.key,
    required this.index,
  });

  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.3,
      width: MediaQuery.of(context).size.width * 0.4,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          'Session ${widget.index}',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black,
              ),
        ),
      ),
    );
  }
}
