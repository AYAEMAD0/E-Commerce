import 'package:e_commerce/core/routing/app_router.dart';
import 'package:e_commerce/features/auth/domain/usecase/forget_password_usecase.dart';
import 'package:e_commerce/features/auth/domain/usecase/login_usecase.dart';
import 'package:e_commerce/features/auth/presentation/cubits/password/password_cubit.dart';
import 'package:e_commerce/features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/routes.dart';
import 'features/auth/domain/usecase/signup_usecase.dart';
import 'features/auth/presentation/cubits/forget_password/forget_password_cubit.dart';
import 'features/auth/presentation/cubits/login/login_cubit.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final SignupUseCase signupUseCase;
  final LoginUseCase loginUseCase;
  final ForgetPasswordUsecase forgetUseCase;

  const MyApp({
    super.key,
    required this.appRouter,
    required this.signupUseCase,
    required this.loginUseCase,
    required this.forgetUseCase,
  });
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => SignupCubit(signupUseCase)),
            BlocProvider(create: (_) => LoginCubit(loginUseCase)),
            BlocProvider(create: (_) => ForgetPasswordCubit(forgetUseCase)),
            BlocProvider(create: (_) => PasswordCubit()),
          ],
       child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.onboardingRouteName,
          onGenerateRoute: appRouter.generateRoute,
        ),
        );
      },
    );
  }
}