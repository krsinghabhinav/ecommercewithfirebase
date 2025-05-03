import 'package:ecommercewithfirebase/common/cusotm_widgets/customText.dart';
import 'package:ecommercewithfirebase/common/cusotm_widgets/custom_button.dart';
import 'package:ecommercewithfirebase/view/authentication/emailVerification/screen/verify_successfully_created_screen.dart';
import 'package:ecommercewithfirebase/view/authentication/login/screen/login_screen.dart';
import 'package:ecommercewithfirebase/view/authentication/password_configuration/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/constants/custom_texts_string.dart';
import '../../../../utils/constants/images_strrings.dart';
import '../../../common/cusotm_widgets/CustomeTextFormField.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Positioned(
              right: Get.height * 0.05,
              top: Get.height * 0.05,
              // top: 40,
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
                  child: Lottie.asset(CustomImages.forgetLotties, height: 300),
                ),
                SizedBox(height: Get.height * 0.03),

                CustomtextWidget(
                  title: CustomTextsString.forgetPassword,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: Get.height * 0.01),
                CustomtextWidget(
                  title: CustomTextsString.forgetpassSubtitle,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Get.height * 0.03),
                CustomeTextFormField(
                  controller: TextEditingController(),
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: CustomTextsString.email,
                ),
                SizedBox(height: Get.height * 0.03),
                CustomButton(
                  onPressed: () {
                    Get.to(ResetPasswordScreen());
                  },
                  title: CustomTextsString.forgetSubmit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
