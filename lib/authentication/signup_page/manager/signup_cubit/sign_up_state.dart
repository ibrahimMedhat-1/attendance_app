part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class ChangeCoursesDropDownMenuValue extends SignUpState {}

class ChangeDateDropDownMenuValue extends SignUpState {}

class SignUpError extends SignUpState {}

class ChangeObscure extends SignUpState {}

class ValidateMenus extends SignUpState {}
