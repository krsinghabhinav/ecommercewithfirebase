import 'package:ecommercewithfirebase/common/cusotm_widgets/customText.dart';
import 'package:ecommercewithfirebase/common/cusotm_widgets/custom_button.dart';
import 'package:ecommercewithfirebase/view/authentication/emailVerification/screen/verify_successfully_created_screen.dart';
import 'package:ecommercewithfirebase/view/authentication/login/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/constants/custom_texts_string.dart';
import '../../../../utils/constants/images_strrings.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Positioned(
              right: 10,
              top: 40,
              child: GestureDetector(
                onTap: () {
                  Get.offAll(LoginScreen());
                },
                child: Image.asset(
                  CustomImages.crossIcon,
                  height: Get.height * 0.05,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: Get.height * 0.1),
                Center(
                  child: Lottie.asset(
                    CustomImages.resetPassTollies,
                    height: 300,
                    width: Get.width * 0.7,
                  ),
                ),
                SizedBox(height: Get.height * 0.01),

                CustomtextWidget(
                  title: CustomTextsString.passReset,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                CustomtextWidget(
                  title: "abhinavsingh@gmailcom",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: Get.height * 0.01),
                CustomtextWidget(
                  title: CustomTextsString.passResetSubTitle,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: Get.height * 0.05),
                CustomButton(
                  onPressed: () {
                    Get.to(VerifySuccessfullyCreatedScreen());
                  },
                  title: CustomTextsString.Resetdone,
                  fontSize: 22,
                ),

                SizedBox(height: Get.height * 0.04),

                TextButton(
                  onPressed: () {},
                  child: CustomtextWidget(
                    title: CustomTextsString.reSend,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
