import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/cusotm_widgets/customText.dart';
import '../../../../../utils/constants/custom_texts_string.dart';
import '../../../../../utils/constants/images_strrings.dart';
import '../../../../../utils/helpers/helper_function.dart';

class Onboardingwidgets extends StatelessWidget {
  final String? onBoaringImageName;
  final String? onBoaringTitle;
  final String? onBoaringDescription;

  const Onboardingwidgets({
    super.key,
    this.onBoaringImageName,
    this.onBoaringTitle,
    this.onBoaringDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: CustomHelperFuctions.screenHeight() * 0.15),

        /// Lottie Animation
        Center(
          child:Lottie.asset(
    onBoaringImageName ?? '',
    height: 300,
    frameRate: FrameRate(30),
    fit: BoxFit.contain,
    repeat: true,
    options: LottieOptions(enableMergePaths: true),
    onLoaded: (composition) {
      // You can log or manage state here
    },
  ),
        ),

        SizedBox(height: CustomHelperFuctions.screenHeight() * 0.17),

        /// Title
        CustomtextWidget(
          title: onBoaringTitle ?? '',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),

        SizedBox(height: CustomHelperFuctions.screenHeight() * 0.01),

        /// Subtitle
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomtextWidget(
            textAlign: TextAlign.center,
            title: onBoaringDescription ?? '',
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
