import 'package:flutter/material.dart';

class StudentProfilePic extends StatelessWidget {
  const StudentProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 20),
      child: Stack(
        alignment: const AlignmentDirectional(1, -1),
        children: [
          const Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                    'assets/profile.jpg'
                ),
              )

          ),
          Align(
            alignment: const AlignmentDirectional(0.27, -0.92),
            child: InkWell(
              onTap: (){},
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Icon(
                    Icons.mode_edit_outlined,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
