part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginVerify extends LoginState {
  final String message;
  LoginVerify(this.message);
}
class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}
