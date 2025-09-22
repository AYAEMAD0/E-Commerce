import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../pages/onboarding_pages.dart';
import '../widgets/built_button.dart';
import '../widgets/built_page_view_model.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 30.h),
          child: IntroductionScreen(
            globalBackgroundColor: AppColor.backgroundLight,
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
            next: BuiltButton(text:"skip"),
            back: BuiltButton(text:"Back",alignment:Alignment.bottomLeft),
            done: BuiltButton(text:"Finish"),

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
