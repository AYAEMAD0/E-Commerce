import 'package:e_commerce/core/constants/app_asset.dart';
import 'package:e_commerce/core/constants/app_strings.dart';
import 'package:e_commerce/features/onboarding/presentation/widgets/built_page_view_model.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingPages {
  static List<PageViewModel> pages = [
    BuiltPageViewModel.build(
      imagePage: AppAsset.onboardingOne,
      titlePage: AppStrings.onboarding1Title,
      descPage: AppStrings.onboarding1Desc,
    ),
    BuiltPageViewModel.build(
      imagePage: AppAsset.onboardingTwo,
      titlePage: AppStrings.onboarding2Title,
      descPage: AppStrings.onboarding2Desc,
    ),
    BuiltPageViewModel.build(
      imagePage: AppAsset.onboardingThree,
      titlePage: AppStrings.onboarding3Title,
      descPage: AppStrings.onboarding3Desc,
    ),
  ];
}
