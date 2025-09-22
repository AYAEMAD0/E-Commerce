import 'package:e_commerce/features/auth/presentation/views/forget_password_view.dart';
import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/features/auth/presentation/views/signup_view.dart';
import 'package:e_commerce/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

class AppRouter {
   Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingRouteName:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case Routes.loginRouteName:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.signupRouteName:
        return MaterialPageRoute(builder: (_) => SignupView());
      case Routes.forgetPasswordRouteName:
        return MaterialPageRoute(builder: (_) => ForgetPasswordView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
