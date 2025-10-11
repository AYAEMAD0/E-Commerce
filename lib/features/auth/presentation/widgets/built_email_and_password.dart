import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helper/validator.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../cubits/password/password_cubit.dart';


class BuiltEmailAndPassword extends StatelessWidget {
  const BuiltEmailAndPassword({
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
    return BlocBuilder<PasswordCubit, PasswordState>(
      builder: (context, state) {
        final passwordCubit = context.read<PasswordCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textPage,
              style: TextStyles.font36BlackBold,
            ),
            SizedBox(height: 23.h),
            CustomTextField(
              hint: AppStrings.email,
              prefixIconName: const Icon(Icons.person),
              keyboard: TextInputType.emailAddress,
              controller: emailController,
              validator: (text) => ValidatorHelper.validateEmail(text),
            ),
            SizedBox(height: 26.h),
            CustomTextField(
              hint: AppStrings.password,
              obscure: state.isObscurePassword,
              prefixIconName: const Icon(Icons.lock),
              suffixIconName: IconButton(
                onPressed: () => passwordCubit.togglePasswordVisibility(),
                icon: state.isObscurePassword
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.remove_red_eye_outlined),
              ),
              controller: passwordController,
              validator: (text) => ValidatorHelper.validatePassword(text),
            ),
            isSignup
                ? Column(
              children: [
                SizedBox(height: 26.h),
                CustomTextField(
                  hint: AppStrings.confirmPassword,
                  obscure: state.isObscureConfirmPassword,
                  prefixIconName: const Icon(Icons.lock),
                  suffixIconName: IconButton(
                    onPressed: () => passwordCubit.toggleConfirmVisibility(),
                    icon: state.isObscureConfirmPassword
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.remove_red_eye_outlined),
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
                : const SizedBox(),
          ],
        );
      },
    );
  }
}