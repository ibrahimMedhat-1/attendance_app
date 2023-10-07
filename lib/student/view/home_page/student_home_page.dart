import 'package:attendance_app/student/view/home_page/widgets/student_profile.dart';
import 'package:flutter/material.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        child: Column(
          children: [
            const StudentProfilePic(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Edit Profile ",style: TextStyle(color: Colors.black),),
                          Icon(  Icons.mode_edit_outlined,)
                          
                        ],
                      ),
                      const Text("data",style: TextStyle(color: Colors.black),),
                      const Text("data",style: TextStyle(color: Colors.black),),
                      const Text("data",style: TextStyle(color: Colors.black),),
                      const Text("data",style: TextStyle(color: Colors.black),),
                      const Text("data",style: TextStyle(color: Colors.black),),
                      const Text("data",style: TextStyle(color: Colors.black),),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(Color(0xFFC4DCF1)),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),),
                          ),
                            onPressed: (){}, child: const Text("My Progress",style: TextStyle(color: Colors.black))),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(Color(0xFFC4DCF1)),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),),
                          ),
                            onPressed: (){}, child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text("SignOut",style: TextStyle(color: Colors.black),),
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
