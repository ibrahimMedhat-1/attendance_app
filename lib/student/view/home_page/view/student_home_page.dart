import 'package:attendance_app/student/view/home_page/view/widgets/student_profile.dart';
import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        child: Column(
          children: [
            const StudentProfilePic(),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Edit Profile ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.width * 0.05,
                            ),
                          ),
                          Icon(
                            Icons.mode_edit_outlined,
                            size: 18,
                          )
                        ],
                      ),
                      Text(
                        "Name : ${sharedStudentData!.name}",
                        style: const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        "Email : ${sharedStudentData!.email}",
                        style: const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        "Phone : ${sharedStudentData!.phoneNo}",
                        style: const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        "Course Name : ${sharedStudentData!.courseName}",
                        style: const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        "Course Date : ${sharedStudentData!.courseDate}",
                        style: const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const Text(
                        "Instructor : ",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(Color(0xFFC4DCF1)),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text("My Progress", style: TextStyle(color: Colors.black))),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(Color(0xFFC4DCF1)),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                "SignOut",
                                style: TextStyle(color: Colors.black),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
