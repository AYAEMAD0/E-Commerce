import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(const PasswordState());
  void togglePasswordVisibility() {
    emit(state.copyWith(isObscurePassword: !state.isObscurePassword));
  }
  void toggleConfirmVisibility() {
    emit(state.copyWith(isObscureConfirmPassword: !state.isObscureConfirmPassword));
  }
}