import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';
import 'font_weight_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle font22BlackExtraBold = GoogleFonts.montserrat(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.extraBold,
    color: AppColor.blackColor,
  );
  // static TextStyle font14BlackSemiBold = GoogleFonts.montserrat(
  //   fontSize: 14.sp,
  //   fontWeight: FontWeightHelper.semiBold,
  //   color: AppColor.blackColor,
  // );
  static TextStyle font14GraySemiBold = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColor.grayTextColor,
  );
  static TextStyle font18PrimarySemiBold = GoogleFonts.montserrat(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColor.primary,
  );
  static TextStyle font36BlackBold = GoogleFonts.montserrat(
    fontSize: 36.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColor.blackColor,
  );
  static TextStyle font12GrayMedium = GoogleFonts.montserrat(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.hintTextFieldColor,
  );
  static TextStyle font12PrimaryRegular = GoogleFonts.montserrat(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColor.primary,
  );
  static TextStyle font20WhiteSemiBold = GoogleFonts.montserrat(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColor.whiteColor,
  );
  static TextStyle font12GrayDarkMedium = GoogleFonts.montserrat(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.textColor,
  );
  static TextStyle font14GrayDarkRegular = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColor.textColor,
  );
  static TextStyle font14PrimarySemiBold = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColor.primary,
  );
  static TextStyle font12GrayRegular = GoogleFonts.montserrat(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColor.hintTextFieldColor,
  );
  static TextStyle font12RedRegular = GoogleFonts.montserrat(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColor.registerColor,
  );
}