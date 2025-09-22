import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helper/validator.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../cubits/login_cubit.dart';

class BuiltLoginWithEmailAndPassword extends StatefulWidget {
  const BuiltLoginWithEmailAndPassword({super.key});

  @override
  State<BuiltLoginWithEmailAndPassword> createState() =>
      _BuiltLoginWithEmailAndPasswordState();
}

class _BuiltLoginWithEmailAndPasswordState
    extends State<BuiltLoginWithEmailAndPassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final value = context.read<LoginCubit>();
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(AppStrings.welcome, style: TextStyles.font36BlackBold),
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
                keyboard: TextInputType.number,
                controller: passwordController,
                validator: (text) => ValidatorHelper.validatePassword(text),
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
            ],
          ),
        );
      },
    );
  }
}
