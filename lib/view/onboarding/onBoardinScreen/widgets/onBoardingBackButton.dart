import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/custom_sizes.dart';
import '../../controller onboarding/onboarding_controller.dart';

class onBoardingBackButton extends StatelessWidget {
  const onBoardingBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingController = Get.put(OnboardingController());

    return Positioned(
      bottom: CustomSizes.defaultSpace + 25,
      right: CustomSizes.defaultSpace,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(side: BorderSide(color: Colors.grey, width: 5)),
        ),
        onPressed: () {
          onboardingController.nextPage();
        },
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
