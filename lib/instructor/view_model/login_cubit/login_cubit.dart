import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
}
