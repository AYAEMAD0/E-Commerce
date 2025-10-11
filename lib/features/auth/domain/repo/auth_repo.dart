import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<void> signup({required String email, required String password});
  Future<User?> login({required String email, required String password});
  Future<void> forgetPassword({required String email});
}
