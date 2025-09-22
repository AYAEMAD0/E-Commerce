import 'package:e_commerce/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/styles.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final int maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboard;
  final Widget? prefixIconName;
  final Widget? suffixIconName;
  final bool? obscure;
  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.validator,
    this.maxLines = 1,
    this.keyboard,
    this.prefixIconName,
    this.suffixIconName,  this.obscure=false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autofocus: false,
      maxLines: maxLines,
      obscureText: obscure!,
      obscuringCharacter: "*",
      cursorColor: AppColor.primary,
      cursorHeight: 25.h,
      cursorWidth: 2.w,
      keyboardType: keyboard ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyles.font12GrayMedium,
        contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
        prefixIcon: prefixIconName,
        suffixIcon: suffixIconName,
        prefixIconColor: AppColor.iconTextFieldColor,
        suffixIconColor: AppColor.iconTextFieldColor,
        enabledBorder: builtBorder(AppColor.borderTextFieldColor),
        focusedBorder: builtBorder(AppColor.borderTextFieldColor),
        errorBorder: builtBorder(AppColor.registerColor),
        focusedErrorBorder: builtBorder(AppColor.registerColor),
        filled: true,
        fillColor: AppColor.fillTextFieldColor,
      ),
    );
  }
}

OutlineInputBorder builtBorder(Color borderSideColor) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: BorderSide(color: borderSideColor, width: 1.5.w),
  );
}
