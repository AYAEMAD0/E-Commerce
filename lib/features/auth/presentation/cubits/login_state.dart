part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class PasswordVisibilityChanged extends LoginState {
  final bool isShow;
  PasswordVisibilityChanged(this.isShow);
}
