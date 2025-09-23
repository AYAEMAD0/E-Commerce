import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool isShowPassword = false;
  bool isShowConfirmPassword=false;

  void togglePassword() {
    isShowPassword = !isShowPassword;
    emit(PasswordVisibilityChanged(isShowPassword));
  }

  void toggleConfirmPassword() {
    isShowConfirmPassword = !isShowConfirmPassword;
    emit(PasswordVisibilityChanged(isShowConfirmPassword));
  }
}
