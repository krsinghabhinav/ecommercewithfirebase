import 'package:ecommercewithfirebase/utils/constants/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/customText.dart';
import '../../../../../utils/constants/custom_sizes.dart';
import '../../../../../utils/devices/device_utility.dart';
import '../../../../../utils/helpers/helper_function.dart';
import '../../controller onboarding/onboarding_controller.dart';

class onBoardingSkip extends StatelessWidget {
  const onBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFuctions.isDarkMode(context);
    final onboardingController = Get.put(OnboardingController());

    return Positioned(
      top: CustomDeviceUtils.getAppBarHeight(),
      right: CustomSizes.defaultSpace,
      child: Card(
        elevation: 2,

        color: dark ? Colors.white : const Color.fromARGB(170, 255, 255, 255),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(CustomSizes.defaultSpace),
        ),
        child: TextButton(
          onPressed: () {
            onboardingController.skipPage();
          },
          child: CustomtextWidget(
            title: "Skip",
            fontSize: 18,
            // color: CustomColors.borderSecondary,
            color:
                dark
                    ? const Color.fromARGB(255, 0, 0, 0)
                    : const Color.fromARGB(136, 0, 13, 255),
          ),
        ),
      ),
    );
  }
}
