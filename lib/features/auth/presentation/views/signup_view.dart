import 'package:e_commerce/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../cubits/login_cubit.dart';
import '../widgets/built _login_with_email_and password.dart';
import '../widgets/continue_with_google_and_facebook.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});
  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                      textPage: AppStrings.createAnAccount,
                      emailController: emailController,
                      passwordController: passwordController,
                      isSignup: true,
                      confirmPasswordController: confirmPasswordController,
                    ),
                    SizedBox(height: 19.h),
                    RichText(
                      text: TextSpan(
                        style: TextStyles.font12GrayRegular,
                        children: [
                          TextSpan(text: AppStrings.byClick),
                          WidgetSpan(
                            child: TextButton(
                              onPressed: () {
                                //todo register
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                AppStrings.register,
                                style: TextStyles.font14RedRegular,
                              ),
                            ),
                          ),
                          TextSpan(text: AppStrings.buttonAgreeOffer),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(
                      text: AppStrings.createAccount,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          //todo logic signup
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
    ));
  }
}
