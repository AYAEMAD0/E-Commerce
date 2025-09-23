import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helper/validator.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../cubits/login_cubit.dart';

class BuiltLoginWithEmailAndPassword extends StatelessWidget {
  const BuiltLoginWithEmailAndPassword({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.isSignup = false,
    this.confirmPasswordController,
    required this.textPage,
  });
  final String textPage;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? confirmPasswordController;
  final bool isSignup;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final value = context.read<LoginCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
             textPage,
              style: TextStyles.font36BlackBold,
            ),
            SizedBox(height: 33.h),
            CustomTextField(
              hint: AppStrings.email,
              prefixIconName: Icon(Icons.person),
              keyboard: TextInputType.emailAddress,
              controller: emailController,
              validator: (text) => ValidatorHelper.validateEmail(text),
            ),
            SizedBox(height: 34.h),
            CustomTextField(
              hint: AppStrings.password,
              obscure: value.isShowPassword,
              prefixIconName: Icon(Icons.lock),
              suffixIconName: IconButton(
                onPressed: () => value.togglePassword(),
                icon: value.isShowPassword
                    ? Icon(Icons.visibility_off_outlined)
                    : Icon(Icons.remove_red_eye_outlined),
              ),
              controller: passwordController,
              validator: (text) => ValidatorHelper.validatePassword(text),
            ),

            isSignup
                ? Column(
                  children: [
                    SizedBox(height: 31.h),
                    CustomTextField(
                        hint: AppStrings.confirmPassword,
                        obscure: value.isShowConfirmPassword,
                        prefixIconName: Icon(Icons.lock),
                        suffixIconName: IconButton(
                          onPressed: () => value.toggleConfirmPassword(),
                          icon: value.isShowConfirmPassword
                              ? Icon(Icons.visibility_off_outlined)
                              : Icon(Icons.remove_red_eye_outlined),
                        ),
                        controller: confirmPasswordController!,
                        validator: (value) =>
                            ValidatorHelper.validateConfirmPassword(
                              value,
                              passwordController.text,
                            ),
                      ),
                  ],
                )
                : SizedBox(),
          ],
        );
      },
    );
  }
}
