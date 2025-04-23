import 'dart:ffi';

import 'package:ecommercewithfirebase/common/widgets/CustomeTextFormField.dart';
import 'package:ecommercewithfirebase/common/widgets/customText.dart';
import 'package:ecommercewithfirebase/utils/constants/custom_texts_string.dart';
import 'package:ecommercewithfirebase/utils/constants/images_strrings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  CustomImages.loginIcons,
                  height: Get.height * 0.35,
                  width: Get.width * 0.8,
                ),
              ),

              const SizedBox(height: 20),

              CustomtextWidget(
                title: CustomTextsString.WelcomeMessage,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              CustomtextWidget(
                title: CustomTextsString.WelcomeMessageDesc,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),

              const SizedBox(height: 30),

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
            ],
          ),
        ),
      ),
    );
  }
}
