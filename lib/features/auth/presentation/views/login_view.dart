import 'package:e_commerce/core/constants/app_strings.dart';
import 'package:e_commerce/core/theme/app_color.dart';
import 'package:e_commerce/features/auth/presentation/cubits/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/built%20_login_with_email_and%20password.dart';
import 'package:e_commerce/features/auth/presentation/widgets/continue_with_google_and_facebook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widgets/custom_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BuiltLoginWithEmailAndPassword(
                      textPage: AppStrings.welcome,
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                    SizedBox(height: 9.h),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          //todo nav into forget password
                        },
                        child: Text(
                          AppStrings.forgotPassword,
                          style: TextStyles.font14PrimaryRegular,
                        ),
                      ),
                    ),
                    SizedBox(height: 52.h),
                    CustomButton(
                      text: AppStrings.login,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          //todo logic login
                        }
                      },
                    ),
                    SizedBox(height: 60.h),
                    ContinueWithGoogleAndFacebook(
                      text: AppStrings.createAnAccount,
                      textButton: AppStrings.signUp,
                      onPressed: () {
                        //todo nav into signup
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.signupRouteName,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    ));
  }
}
