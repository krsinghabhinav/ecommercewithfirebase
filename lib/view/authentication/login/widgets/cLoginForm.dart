import 'package:ecommercewithfirebase/common/cusotm_widgets/CustomeTextFormField.dart';
import 'package:ecommercewithfirebase/common/cusotm_widgets/customText.dart';
import 'package:ecommercewithfirebase/common/cusotm_widgets/custom_button.dart';
import 'package:ecommercewithfirebase/common/cusotm_widgets/navigation_bar_menu.dart';
import 'package:ecommercewithfirebase/utils/constants/custom_texts_string.dart';
import 'package:ecommercewithfirebase/utils/constants/images_strrings.dart';
import 'package:ecommercewithfirebase/view/authentication/password_configuration/forget_password_screen.dart';
import 'package:ecommercewithfirebase/view/authentication/signup/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/cLoginHeader.dart';

class cLoginForm extends StatelessWidget {
  const cLoginForm({super.key, required GlobalKey<FormState> formKey})
    : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              CustomeTextFormField(
                controller: TextEditingController(),
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: CustomTextsString.email,
              ),
              SizedBox(height: Get.height * 0.02),
              CustomeTextFormField(
                controller: TextEditingController(),
                prefixIcon: Icon(Iconsax.password_check),
                labelText: CustomTextsString.pass,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                CustomtextWidget(title: CustomTextsString.rememberMe),
              ],
            ),
            TextButton(
              onPressed: () {
                Get.off(ForgetPassword());
              },
              child: Text(CustomTextsString.forgetPassword),
            ),
          ],
        ),
        CustomButton(
          onPressed: () {
            Get.to(NavigationBarMenu());
          },
          title: CustomTextsString.signIn,
          fontSize: 20,
        ),

        SizedBox(height: Get.height * 0.02),

        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              Get.off(SignupScreen());
            },
            child: CustomtextWidget(
              title: CustomTextsString.createAcount,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
