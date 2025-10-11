import 'package:e_commerce/core/constants/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecase/login_usecase.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final user = await loginUseCase(email: email, password: password);
      if (user != null && user.emailVerified) {
        emit(LoginSuccess());
      } else if (user != null && !user.emailVerified) {
        emit(LoginVerify(AppStrings.emailVerifiedYet));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
