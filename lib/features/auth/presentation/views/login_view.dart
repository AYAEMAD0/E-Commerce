import 'package:e_commerce/core/constants/app_asset.dart';
import 'package:e_commerce/core/constants/app_strings.dart';
import 'package:e_commerce/core/theme/app_color.dart';
import 'package:e_commerce/features/auth/presentation/cubits/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/built%20_login_with_email_and%20password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/styles.dart';
import '../widgets/social_item_login.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
              child: Column(
                children: [
                  BuiltLoginWithEmailAndPassword(),
                  SizedBox(height: 75.h),
                  Text(
                    AppStrings.orContinueWith,
                    textAlign: TextAlign.center,
                    style: TextStyles.font14GrayDarkMedium,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialItemLogin(
                        svgImage: AppAsset.googleImage,
                        onTap: () {
                          //todo login with google
                        },
                      ),
                      SizedBox(width: 10.w),
                      SocialItemLogin(
                        svgImage: AppAsset.facebookImage,
                        onTap: () {
                          //todo login with facebook
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 28.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.createAccount,
                        style: TextStyles.font14GrayDarkRegular,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            //todo nav into signup
                          },
                          child: Text(
                            AppStrings.signUp,
                            style: TextStyles.font14PrimarySemiBold.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColor.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
