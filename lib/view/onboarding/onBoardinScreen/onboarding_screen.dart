import 'package:ecommercewithfirebase/common/cusotm_widgets/customText.dart';
import 'package:ecommercewithfirebase/utils/constants/custom_colors.dart';
import 'package:ecommercewithfirebase/utils/constants/custom_sizes.dart';
import 'package:ecommercewithfirebase/utils/constants/custom_texts_string.dart';
import 'package:ecommercewithfirebase/utils/devices/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/images_strrings.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../../controller/onboarding_controller.dart';
import 'widgets/onBoardingBackButton.dart';
import 'widgets/onBoardingDotNavigation.dart';
import 'widgets/onBoardingSkip.dart';
import 'widgets/onboardingWidgets.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  OnboardingController onboardingController = Get.put(OnboardingController());
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: onboardingController.pageController,
            onPageChanged: onboardingController.updatePageIndicator,
            children: [
              Onboardingwidgets(
                onBoaringImageName: CustomImages.onboardingLotti1,
                onBoaringTitle: CustomTextsString.onBoardingTitle1,
                onBoaringDescription: CustomTextsString.onBoardingSubTitlel,
              ),
              Onboardingwidgets(
                onBoaringImageName: CustomImages.onboardingLotti2,
                onBoaringTitle: CustomTextsString.onBoardingTitle2,
                onBoaringDescription: CustomTextsString.onBoardingSubTitle2,
              ),
              Onboardingwidgets(
                onBoaringImageName: CustomImages.onboardingLotti3,
                onBoaringTitle: CustomTextsString.onBoardingTitle3,
                onBoaringDescription: CustomTextsString.onBoardingSubTitle3,
              ),
            ],
          ),

          onBoardingSkip(),

          onBoardingDotNavigation(),

          onBoardingBackButton(),
        ],
      ),
    );
  }
}
