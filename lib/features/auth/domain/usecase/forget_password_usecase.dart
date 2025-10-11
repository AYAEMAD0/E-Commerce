import '../repo/auth_repo.dart';

class ForgetPasswordUsecase {
  final AuthRepository repository;

  ForgetPasswordUsecase(this.repository);

  Future<void> call({required String email}) async {
    return await repository.forgetPassword(email: email);
  }
}