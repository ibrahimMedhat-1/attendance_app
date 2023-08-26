import 'package:flutter/material.dart';

class EditAssignmentCard extends StatefulWidget {
  final int index;

  const EditAssignmentCard({
    super.key,
    required this.index,
  });

  @override
  State<EditAssignmentCard> createState() => _EditAssignmentCardState();
}

class _EditAssignmentCardState extends State<EditAssignmentCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
