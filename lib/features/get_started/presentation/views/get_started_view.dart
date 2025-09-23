import 'package:e_commerce/core/constants/app_asset.dart';
import 'package:e_commerce/core/constants/app_strings.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/styles.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAsset.getStartedImage),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 25.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppStrings.wantAuthentic,
                textAlign: TextAlign.center,
                style: TextStyles.font34WhiteSemiBold,
              ),
              SizedBox(height: 14.h),
              Text(
                AppStrings.findBuy,
                textAlign: TextAlign.center,
                style: TextStyles.font14lightWhiteGetStartedRegular,
              ),
              SizedBox(height: 27.h),
              CustomButton(
                text: AppStrings.getStarted,
                onPressed: () {
                  //todo nav into home
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
