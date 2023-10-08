import 'package:flutter/material.dart';

class EditQuizCard extends StatefulWidget {
  final int index;

  const EditQuizCard({super.key, required this.index});

  @override
  State<EditQuizCard> createState() => _EditQuizCardState();
}

class _EditQuizCardState extends State<EditQuizCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              'Quiz ${widget.index}',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
