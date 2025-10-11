import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseDataSource {
  final FirebaseAuth firebaseAuth;

  AuthFirebaseDataSource({required this.firebaseAuth});

  Future<void> signupWithEmail(String email, String password) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception('This email is already registered.');
      } else if (e.code == 'weak-password') {
        throw Exception('The password is too weak.');
      } else {
        throw Exception(e.message ?? 'Signup failed.');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<User?> login(String email, String password) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for this email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Incorrect password.');
      } else if (e.code == 'invalid-email') {
        throw Exception('Invalid email format.');
      } else {
        throw Exception(e.message ?? 'Login failed.');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<void> forgetPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for this email.');
      } else {
        throw Exception(e.message ?? 'Failed to send reset email.');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
