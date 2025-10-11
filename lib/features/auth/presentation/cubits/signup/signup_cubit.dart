import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../domain/usecase/signup_usecase.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;

  SignupCubit(this.signupUseCase) : super(SignupInitial());

  Future<void> signup(String email, String password) async {
    emit(SignupLoading());
    try {
      await signupUseCase(email: email, password: password);
      emit(
        SignupSuccess(
          '${AppStrings.verificationEmail} $email. ${AppStrings.verifyBeforeLogin}',
        ),
      );
    } catch (e) {
      emit(SignupError(e.toString()));
    }
  }
}
