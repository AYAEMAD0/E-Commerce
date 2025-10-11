import '../repo/auth_repo.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  Future<void> call({required String email, required String password}) {
    return repository.signup(email: email, password: password);
  }
}
