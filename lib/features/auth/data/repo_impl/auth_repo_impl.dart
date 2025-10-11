

import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repo/auth_repo.dart';
import '../data_sources/auth_firebase_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> signup({required String email, required String password}) async {
    await remoteDataSource.signupWithEmail(email, password);
  }
  @override
  Future<User?> login({required String email, required String password}) async {
    return await remoteDataSource.login(email,password);
  }
  @override
  Future<void> forgetPassword({required String email}) async {
    await remoteDataSource.forgetPassword(email);
  }
}
