import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecase/forget_password_usecase.dart';
part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUsecase forgetPasswordUseCase;

  ForgetPasswordCubit(this.forgetPasswordUseCase) : super(ForgetPasswordInitial());

  Future<void> sendPasswordResetEmail(String email) async {
    emit(ForgetPasswordLoading());
    try {
      await forgetPasswordUseCase(email:email);
      emit(ForgetPasswordSuccess());
    } catch (e) {
      emit(ForgetPasswordFailure(e.toString()));
    }
  }
}
