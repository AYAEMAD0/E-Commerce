import 'package:e_commerce/my_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/routing/app_router.dart';
import 'features/auth/data/data_sources/auth_firebase_data_source.dart';
import 'features/auth/data/repo_impl/auth_repo_impl.dart';
import 'features/auth/domain/usecase/forget_password_usecase.dart';
import 'features/auth/domain/usecase/login_usecase.dart';
import 'features/auth/domain/usecase/signup_usecase.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final dataSource = AuthFirebaseDataSource(
    firebaseAuth: FirebaseAuth.instance,
  );
  final repository = AuthRepositoryImpl(dataSource);
  final signupUseCase = SignupUseCase(repository);
  final loginUseCase = LoginUseCase(repository);
  final forgetUseCase = ForgetPasswordUsecase(repository);
  runApp(
    MyApp(
      appRouter: AppRouter(),
      signupUseCase: signupUseCase,
      loginUseCase: loginUseCase,
      forgetUseCase: forgetUseCase,
    ),
  );
}
