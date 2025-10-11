import 'package:e_commerce/core/constants/app_strings.dart';
import 'package:e_commerce/core/theme/app_color.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/auth_state_handler.dart';
import '../../../../core/helper/validator.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../cubits/forget_password/forget_password_cubit.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});
  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AuthStateHandler.handleAuthState<
      ForgetPasswordCubit,
      ForgetPasswordState
    >(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.whiteColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppStrings.forgotPasswordPage,
                      style: TextStyles.font36BlackBold,
                    ),
                    SizedBox(height: 30.h),
                    CustomTextField(
                      hint: AppStrings.emailAddress,
                      prefixIconName: Icon(Icons.email),
                      keyboard: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (text) => ValidatorHelper.validateEmail(text),
                    ),
                    SizedBox(height: 30.h),
                    RichText(
                      text: TextSpan(
                        style: TextStyles.font14GrayMedium,
                        children: [
                          TextSpan(
                            text: AppStrings.starForgotPassword,
                            style: TextStyles.font14RedRegular,
                          ),
                          TextSpan(text: AppStrings.sendMessage),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(
                      text: AppStrings.submit,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context
                              .read<ForgetPasswordCubit>()
                              .sendPasswordResetEmail(emailController.text);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      onSuccess: (context, state) {
        if (state is ForgetPasswordSuccess) {
          CustomDialog.showMessage(
            context: context,
            background: AppColor.whiteColor,
            title: AppStrings.success,
            styleTitle: TextStyles.font21PrimaryBold,
            message: AppStrings.resetPasswordSent,
            styleMessage: TextStyles.font18BlackMedium,
            posActionName: AppStrings.ok,
            stylePosActionName: TextStyles.font21PrimaryBold,
          );
        }
      },
    );
  }
}
