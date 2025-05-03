import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/cusotm_widgets/customText.dart';
import '../../../../utils/constants/custom_texts_string.dart';
import '../../../../utils/constants/images_strrings.dart';

class cLoginHeader extends StatelessWidget {
  const cLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Center(
          child: Image.asset(
            CustomImages.loginIcons,
            height: Get.height * 0.25,
            width: Get.width * 0.6,
          ),
        ),

        SizedBox(height: Get.height * 0.01),

        CustomtextWidget(
          title: CustomTextsString.WelcomeMessage,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: Get.height * 0.01),
        CustomtextWidget(
          title: CustomTextsString.WelcomeMessageDesc,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
