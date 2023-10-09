import 'package:attendance_app/model/student_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../model/instructor_model.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  static SignUpCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController nameControllerInstructor = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController emailControllerInstructor = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordControllerInstructor = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String? coursesDropDownMenuValue;
  String? dateDropDownMenuValue;
  bool coursesMenuIsChosen = true;
  bool dateMenuIsChosen = true;
  IconData suffixIcon = Icons.visibility_off;
  bool validated = false;
  bool obscure = true;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(debugLabel: 'signupFormKey');
  GlobalKey<FormState> signupFormKeyInst = GlobalKey<FormState>(debugLabel: 'signupFormKeyInst');
  List<DropdownMenuItem<String>> courses = const [
    DropdownMenuItem(
      value: 'FlutterBeginner',
      child: Text('Flutter Beginner'),
    ),
    DropdownMenuItem(
      value: 'FlutterAdvanced',
      child: Text('Flutter Advanced'),
    ),
    DropdownMenuItem(
      value: 'DataStructure',
      child: Text('Data Structure'),
    ),
    DropdownMenuItem(
      value: 'ObjectOrientedProgramming',
      child: Text('Object Oriented Programming'),
    ),
  ];
  List<DropdownMenuItem<String>> dates = const [
    DropdownMenuItem(
      value: 'Saturday-Tuesday',
      child: Text('Saturday - Tuesday'),
    ),
    DropdownMenuItem(
      value: 'Sunday-Wednesday',
      child: Text('Sunday - Wednesday'),
    ),
    DropdownMenuItem(
      value: 'Monday-Thursday',
      child: Text('Monday - Thursday'),
    ),
  ];

  void changeCoursesMenu() {
    coursesMenuIsChosen = true;
    emit(ChangeCoursesDropDownMenuValue());
  }

  void changeDateMenu() {
    dateMenuIsChosen = true;
    emit(ChangeDateDropDownMenuValue());
  }

  void validateMenus() {
    if (coursesDropDownMenuValue == null) {
      coursesMenuIsChosen = false;
      emit(ValidateMenus());
    }
    if (dateDropDownMenuValue == null) {
      dateMenuIsChosen = false;
      emit(ValidateMenus());
    }
  }

  void changeCoursesDropDownMenuValue(String newValue) {
    coursesDropDownMenuValue = newValue;
    emit(ChangeCoursesDropDownMenuValue());
  }

  void changeDateDropDownMenuValue(String newValue) {
    dateDropDownMenuValue = newValue;
    emit(ChangeDateDropDownMenuValue());
  }

  void login(value) {
    validated = value;
    emit(SignUpError());
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

  void instructorSignup({required InstructorModel instructorModel, required String password}) {
    String uid;
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: instructorModel.email!, password: password)
        .then((value) {
      uid = value.user!.uid;
      FirebaseFirestore.instance.collection("instructor").doc(uid).set(instructorModel.toMap(id: uid));
    });
  }

  void signup({
    required StudentModel studentModel,
    required String password,
  }) {
    String uid;
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: studentModel.email!, password: password).then((value) {
      uid = value.user!.uid;
      FirebaseFirestore.instance
          .collection('students')
          .doc(uid)
          .set({"id": uid, "courseName": studentModel.courseName, "courseDate": studentModel.courseDate}).then((value) {
        FirebaseFirestore.instance.collection('courses').doc(studentModel.courseName!).set({
          'studentsNumber': 0,
        }).then((value) {
          FirebaseFirestore.instance
              .collection('courses')
              .doc(studentModel.courseName!)
              .collection("dates")
              .doc(studentModel.courseDate!)
              .collection("students")
              .doc(uid)
              .set(studentModel.toMap(id: uid))
              .then((value) {
            FirebaseFirestore.instance
                .collection('courses')
                .doc(studentModel.courseName!)
                .collection("dates")
                .doc(studentModel.courseDate!)
                .set({
              'studentNumberInThisDate': 0,
            }).then((value) {
              FirebaseFirestore.instance
                  .collection('courses')
                  .doc(studentModel.courseName!)
                  .collection("dates")
                  .doc(studentModel.courseDate!)
                  .collection("students")
                  .doc(uid)
                  .collection("grades")
                  .doc("grades")
                  .set(studentModel.gradesToMap())
                  .then((value) {
                FirebaseFirestore.instance
                    .collection('courses')
                    .doc(studentModel.courseName!)
                    .collection('dates')
                    .doc(studentModel.courseDate!)
                    .collection("students")
                    .get()
                    .then((value) {
                  FirebaseFirestore.instance
                      .collection('courses')
                      .doc(studentModel.courseName!)
                      .collection("dates")
                      .doc(studentModel.courseDate!)
                      .update({
                    'studentNumberInThisDate': value.docs.length,
                  });
                });
              }).then((value) async {
                int studentsCount = 0;
                await FirebaseFirestore.instance
                    .collection('courses')
                    .doc(studentModel.courseName!)
                    .collection('dates')
                    .get()
                    .then((value) async {
                  for (var element in value.docs) {
                    await element.reference.collection('students').get().then((value) {
                      studentsCount += value.docs.length;
                    });
                  }
                  FirebaseFirestore.instance
                      .collection('courses')
                      .doc(studentModel.courseName!)
                      .update({"studentsNumber": studentsCount});
                });
              });
            });
          });
        });
      });
    });
  }
}
