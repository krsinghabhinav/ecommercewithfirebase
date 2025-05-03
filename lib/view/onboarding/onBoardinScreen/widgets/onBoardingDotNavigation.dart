import 'package:ecommercewithfirebase/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/custom_colors.dart';
import '../../../../../utils/constants/custom_sizes.dart';
import '../../../../controller/onboarding_controller.dart';

class onBoardingDotNavigation extends StatelessWidget {
  const onBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingController = Get.put(OnboardingController());

    final dark = CustomHelperFuctions.isDarkMode(context);
    return Positioned(
      bottom: CustomSizes.defaultSpace + 40,
      left: CustomSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: onboardingController.pageController,
        onDotClicked: onboardingController.dotNavigationclick,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? CustomColors.light : CustomColors.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}
