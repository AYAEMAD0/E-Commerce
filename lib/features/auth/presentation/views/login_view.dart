import 'package:e_commerce/core/constants/app_strings.dart';
import 'package:e_commerce/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/auth_state_handler.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../cubits/login/login_cubit.dart';
import '../widgets/built_email_and_password.dart';
import '../widgets/continue_with_google_and_facebook.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthStateHandler.handleAuthState<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
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
                      BuiltEmailAndPassword(
                        textPage: AppStrings.welcome,
                        emailController: emailController,
                        passwordController: passwordController,
                      ),
                      SizedBox(height: 3.h),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            //todo nav to forget password
                            Navigator.pushNamed(
                              context,
                              Routes.forgetPasswordRouteName,
                            );
                          },
                          child: Text(
                            AppStrings.forgotPassword,
                            style: TextStyles.font14PrimaryMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: 52.h),
                      CustomButton(
                        text: AppStrings.login,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginCubit>().login(
                              emailController.text,
                              passwordController.text,
                            );
                          }
                        },
                      ),
                      SizedBox(height: 60.h),
                      ContinueWithGoogleAndFacebook(
                        text: AppStrings.createAnAccount,
                        textButton: AppStrings.signUp,
                        onPressed: () {
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
        );
      },
      onSuccess: (context, state) {
        if (state is LoginSuccess) {
          CustomDialog.showMessage(
            context: context,
            background: AppColor.whiteColor,
            message: AppStrings.loginSuccessfully,
            styleMessage: TextStyles.font18BlackMedium,
            title: AppStrings.success,
            styleTitle: TextStyles.font21PrimaryBold,
            posActionName: AppStrings.ok,
            stylePosActionName: TextStyles.font21PrimaryBold,
            posActionClick: () {
              // TODO: Navigate get start

            },
          );
        } else if (state is LoginVerify) {
          CustomDialog.showMessage(
            context: context,
            background: AppColor.whiteColor,
            title: AppStrings.emailNotVerified,
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
