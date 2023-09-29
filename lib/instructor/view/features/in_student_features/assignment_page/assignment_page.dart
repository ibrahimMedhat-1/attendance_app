import 'package:flutter/material.dart';

import 'widgets/assignment_page_card.dart';

class AssignmentPage extends StatelessWidget {
  const AssignmentPage({super.key});

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
                    20,
                    (index) => AssignmentCard(
                          index: index + 1,
                        )),
              ),
            ),
            Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  'Total Submitted : 0',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  'Total delayed : 20',
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
