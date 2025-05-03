import 'package:ecommercewithfirebase/common/cusotm_widgets/CustomeTextFormField.dart';
import 'package:ecommercewithfirebase/common/cusotm_widgets/customText.dart';
import 'package:ecommercewithfirebase/utils/constants/custom_texts_string.dart';
import 'package:ecommercewithfirebase/utils/constants/images_strrings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/cLoginForm.dart';
import '../widgets/cLoginHeader.dart';
import '../widgets/cSocialButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
                //loginheader
                cLoginHeader(),

                SizedBox(height: Get.height * 0.02),
                //form
                cLoginForm(formKey: _formKey),
                SizedBox(height: Get.height * 0.02),
                //divider
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(child: Divider()),
                      SizedBox(width: Get.width * 0.02),

                      CustomtextWidget(
                        title: CustomTextsString.orSignWith,
                        color: Colors.grey,
                      ),
                      SizedBox(width: Get.width * 0.02),

                      Flexible(child: Divider()),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                //footer
                cSocialButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
