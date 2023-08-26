import 'package:attendance_app/instructor/view/assignment_page/assignment_description_page/assignment_description_page.dart';
import 'package:flutter/material.dart';

class AssignmentCard extends StatefulWidget {
  final int index;

  const AssignmentCard({
    super.key,
    required this.index,
  });

  @override
  State<AssignmentCard> createState() => _AssignmentCardState();
}

class _AssignmentCardState extends State<AssignmentCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (builder) => const AssignmentDescriptionPage()));
      },
      child: Container(
        height: MediaQuery.of(context).size.width * 0.3,
        width: MediaQuery.of(context).size.width * 0.4,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            'Assignment ${widget.index}',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
        ),
      ),
    );
  }
}
