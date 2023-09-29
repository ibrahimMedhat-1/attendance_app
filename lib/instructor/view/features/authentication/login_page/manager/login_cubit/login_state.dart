part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginError extends LoginState {}

class ChangeObscure extends LoginState {}

class ChangeScreenFit extends LoginState {}
