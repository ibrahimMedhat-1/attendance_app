import 'package:flutter/material.dart';

class StudentProfilePic extends StatelessWidget {
  const StudentProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.17,
            backgroundImage: AssetImage('assets/profile.jpg'),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.05,
              margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.01,
                top: MediaQuery.of(context).size.width * 0.01,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.mode_edit_outlined,
                color: Colors.black,
                size: MediaQuery.of(context).size.width * 0.03,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
