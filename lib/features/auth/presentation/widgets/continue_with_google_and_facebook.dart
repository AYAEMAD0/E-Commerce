import 'package:e_commerce/features/auth/presentation/widgets/social_item_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_asset.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/routing/routes.dart' show Routes;
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/styles.dart';

class ContinueWithGoogleAndFacebook extends StatelessWidget {
  const ContinueWithGoogleAndFacebook({
    super.key,
    required this.text,
    required this.textButton,
    required this.onPressed,
  });
  final String text;
  final String textButton;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            Text(text, style: TextStyles.font14GrayDarkRegular),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: onPressed,
                child: Text(
                  textButton,
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
    );
  }
}
