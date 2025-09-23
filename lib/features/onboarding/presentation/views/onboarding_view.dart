import 'package:e_commerce/core/constants/app_strings.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../auth/presentation/cubits/login_cubit.dart';
import '../pages/onboarding_pages.dart';
import '../widgets/built_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
            child: IntroductionScreen(
              globalBackgroundColor: AppColor.whiteColor,
              pages: OnboardingPages.pages,
              dotsDecorator: DotsDecorator(
                color: AppColor.indicatorUnactiveColor,
                activeColor: AppColor.indicatorActiveColor,
                activeSize: Size(40.w, 8.h),
                size: Size(10.w, 10.h),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.sp),
                ),
              ),
              showBackButton: true,
              showNextButton: true,
              showDoneButton: true,
              next: BuiltButton(text: AppStrings.next),
              back: BuiltButton(
                text: AppStrings.back,
                alignment: Alignment.bottomLeft,
              ),
              done: BuiltButton(text: AppStrings.finish),
              onDone: () {
                //todo done
                Navigator.pushReplacementNamed(context, Routes.loginRouteName);
              },
            ),
          ),
        ),
    );
  }
}
