import 'package:e_commerce/core/routing/app_router.dart';
import 'package:e_commerce/features/auth/data/data_sources/auth_firebase_data_source.dart';
import 'package:e_commerce/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:e_commerce/features/auth/domain/usecase/forget_password_usecase.dart';
import 'package:e_commerce/features/auth/domain/usecase/login_usecase.dart';
import 'package:e_commerce/features/auth/domain/usecase/signup_usecase.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/my_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  });

  testWidgets('Test MyApp UI', (WidgetTester tester) async {
    final dataSource = AuthFirebaseDataSource(firebaseAuth: FirebaseAuth.instance);
    final repository = AuthRepositoryImpl(dataSource);
    final signupUseCase = SignupUseCase(repository);
    final loginUseCase = LoginUseCase(repository);
    final forgetUseCase = ForgetPasswordUsecase(repository);

    await tester.pumpWidget(MyApp(
      appRouter: AppRouter(),
      signupUseCase: signupUseCase,
      loginUseCase: loginUseCase,
      forgetUseCase: forgetUseCase,
    ));

    await tester.pumpAndSettle();

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
