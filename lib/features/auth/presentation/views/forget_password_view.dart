import 'package:e_commerce/core/constants/app_strings.dart';
import 'package:e_commerce/core/theme/app_color.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/validator.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widgets/custom_text_field.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});
  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppStrings.forgotPasswordPage,
                style: TextStyles.font36BlackBold,
              ),
              SizedBox(height: 23.h),
              CustomTextField(
                hint: AppStrings.emailAddress,
                prefixIconName: Icon(Icons.email),
                keyboard: TextInputType.emailAddress,
                controller: emailController,
                validator: (text) => ValidatorHelper.validateEmail(text),
              ),
              SizedBox(height: 26.h),
              RichText(
                text: TextSpan(
                  style: TextStyles.font12GrayRegular,
                  children: [
                    TextSpan(
                      text: AppStrings.starForgotPassword,
                      style: TextStyles.font14RedRegular,
                    ),
                    TextSpan(text: AppStrings.sendMessage),
                  ],
                ),
              ),
              SizedBox(height: 26.h),
              CustomButton(
                text: AppStrings.submit,
                onPressed: () {
                  //todo submit in forgot password logic
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
