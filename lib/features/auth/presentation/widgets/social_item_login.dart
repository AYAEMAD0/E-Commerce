import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theme/app_color.dart';

class SocialItemLogin extends StatelessWidget {
  const SocialItemLogin({
    super.key,
    required this.svgImage,
    required this.onTap,
  });

  final String svgImage;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      borderRadius: BorderRadius.circular(25.sp),
      child: Container(
        height: 56.h,
        width: 56.w,
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 13.h,
        ),
        decoration: BoxDecoration(
          color: AppColor.backgroundCircleSocialColor,
          shape: BoxShape.circle,
          border: Border.all(color: AppColor.primary, width: 1.5.w),
        ),
        child: SvgPicture.asset(svgImage),
      ),
    );
  }
}
