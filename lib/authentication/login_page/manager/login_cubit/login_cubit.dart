import 'package:attendance_app/instructor/layout/layout.dart';
import 'package:attendance_app/student/layout/student_layout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../model/student_model.dart';
import '../../../../student/shared/shared.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String? coursesDropDownMenuValue;
  String? dateDropDownMenuValue;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>(debugLabel: 'loginFormKey');
  bool loggedIn = false;
  bool obscure = true;
  IconData suffixIcon = Icons.visibility_off;
  double height = 0.7;

  void login(value) {
    loggedIn = value;
    emit(LoginError());
  }

  void changeObscure() {
    obscure = !obscure;
    if (obscure) {
      suffixIcon = Icons.visibility_off;
      emit(ChangeObscure());
    } else {
      suffixIcon = Icons.remove_red_eye;
      emit(ChangeObscure());
    }
  }

  void fitScreen() {
    height = 0.4;
    emit(ChangeScreenFit());
  }

  void reFitScreen() {
    height = 0.7;
    emit(ChangeScreenFit());
  }

  void logIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    String uid;

    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) async {
      uid = value.user!.uid;
      bool isInstructor = false;

      await FirebaseFirestore.instance.collection('instructor').get().then((value) {
        for (var element in value.docs) {
          if (element.id == email) {
            isInstructor = true;
            break;
          }
        }
        if (isInstructor) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => const InstructorLayOut()));
        } else {
          FirebaseFirestore.instance.collection("students").doc(uid).get().then((value) async {
            var courseName = await value.data()!["courseName"];
            var courseDate = await value.data()!["courseDate"];
            FirebaseFirestore.instance
                .collection('courses')
                .doc(courseName)
                .collection('dates')
                .doc(courseDate)
                .collection("students")
                .doc(uid)
                .get()
                .then((value) async {
              Map<String, dynamic>? grades;
              await FirebaseFirestore.instance
                  .collection('courses')
                  .doc(courseName)
                  .collection('dates')
                  .doc(courseDate)
                  .collection("students")
                  .doc(uid)
                  .collection('grades')
                  .doc('grades')
                  .get()
                  .then((value) {
                grades = value.data();
              });
              sharedStudentData = StudentModel.fromJson(value.data(), grades);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const StudentLayOut(),
              ));
            });
          });
        }
      });
    }).catchError((e) {
      if (e.code == 'user-not-found') {
        debugPrint("object");
        emit(LoginError());
        showSnackBar(context: context, text: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        emit(LoginError());
        showSnackBar(context: context, text: 'Wrong password.');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('An error occurred.'),
          ),
        );
      }
    });
  }

  dynamic showSnackBar({required context, required String text}) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );
}
