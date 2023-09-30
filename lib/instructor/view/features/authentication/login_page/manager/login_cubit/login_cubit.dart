

import 'package:attendance_app/model/student_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../layout/layout.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  TextEditingController phoneNumberController =TextEditingController();
  String? coursesDropDownMenuValue;
  String? dateDropDownMenuValue;

  GlobalKey<FormState> loginFormKey =
  GlobalKey<FormState>(debugLabel: 'loginFormKey');
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
    required StudentModel studentModel,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: studentModel.email!, password: password)
          .then((value) async {
        await FirebaseFirestore.instance
            .collection(studentModel.courseName!)
            .doc(studentModel.courseDate)
            .collection("students")
            .get()
            .then((value) {
          emit(LoginSuccess());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const LayOut(),
            ),
          );
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginError());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('No user found for that email.'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        emit(LoginError());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Wrong password.'),
          ),
        );
      }
    } catch (e) {
      emit(LoginError());
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('An error occurred.'),
        ),
      );
    }
  }
}



