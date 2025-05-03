import 'package:ecommercewithfirebase/common/cusotm_widgets/customText.dart';
import 'package:ecommercewithfirebase/common/cusotm_widgets/custom_button.dart';
import 'package:ecommercewithfirebase/view/authentication/login/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/constants/custom_texts_string.dart';
import '../../../../utils/constants/images_strrings.dart';

class VerifySuccessfullyCreatedScreen extends StatefulWidget {
  const VerifySuccessfullyCreatedScreen({super.key});

  @override
  State<VerifySuccessfullyCreatedScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<VerifySuccessfullyCreatedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.1),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Center(
                child: Lottie.asset(
                  CustomImages.verifyemailLottiesuccessful,
                  height: 300,
                ),
              ),
            ),
            CustomtextWidget(
              title: CustomTextsString.verifysuccessfully,
              fontSize: 22,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Get.height * 0.01),
            CustomtextWidget(
              title: CustomTextsString.verifyemialdes,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: Get.height * 0.05),

            CustomButton(
              onPressed: () {
                Get.to(LoginScreen());
              },
              title: CustomTextsString.continuee,
            ),

            SizedBox(height: Get.height * 0.05),
          ],
        ),
      ),
    );
  }
}
