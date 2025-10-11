import 'package:firebase_auth/firebase_auth.dart';
import '../repo/auth_repo.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);
  Future<User?> call({required String email, required String password}) async {
    return await repository.login(email: email, password: password);
  }
}
