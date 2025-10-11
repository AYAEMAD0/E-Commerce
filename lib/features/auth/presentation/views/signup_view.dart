import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/core/theme/app_color.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_dialog.dart';
import 'package:e_commerce/features/auth/presentation/cubits/password/password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helper/auth_state_handler.dart';
import '../../../../core/theme/styles.dart';
import '../cubits/signup/signup_cubit.dart';
import '../cubits/signup/signup_state.dart';
import '../widgets/built_email_and_password.dart';
import '../widgets/continue_with_google_and_facebook.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return AuthStateHandler.handleAuthState<SignupCubit, SignupState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.whiteColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      BlocProvider(
                        create: (context) => PasswordCubit(),
                        child: BuiltEmailAndPassword(
                          textPage: AppStrings.createAnAccount,
                          emailController: emailController,
                          passwordController: passwordController,
                          isSignup: true,
                          confirmPasswordController: confirmPasswordController,
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                        text: AppStrings.createAccount,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<SignupCubit>().signup(
                              emailController.text,
                              passwordController.text,
                            );
                          }
                        },
                      ),
                      SizedBox(height: 30.h),
                      ContinueWithGoogleAndFacebook(
                        text: AppStrings.alreadyAccount,
                        textButton: AppStrings.login,
                        onPressed: () {
                          //todo nav into login
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.loginRouteName,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
       onSuccess: (context, state) {
         if (state is SignupSuccess) {
           CustomDialog.showMessage(
             context: context,
             background: AppColor.whiteColor,
             title: AppStrings.success,
             styleTitle: TextStyles.font21PrimaryBold,
             message:state.message,
             styleMessage: TextStyles.font18BlackMedium,
             posActionName: AppStrings.ok,
             stylePosActionName: TextStyles.font21PrimaryBold,
             posActionClick: () {
               Navigator.pushReplacementNamed(context, Routes.loginRouteName);
             },
           );
         } else if (state is SignupError) {
           CustomDialog.showMessage(
             context: context,
             background: AppColor.whiteColor,
             title: AppStrings.error,
             styleTitle: TextStyles.font21PrimaryBold,
             message: state.message,
             styleMessage: TextStyles.font18BlackMedium,
             posActionName: AppStrings.ok,
             stylePosActionName: TextStyles.font21PrimaryBold,
           );
         }
       },
     );
  }
}