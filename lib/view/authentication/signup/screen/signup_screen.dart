import 'package:ecommercewithfirebase/common/cusotm_widgets/CustomeTextFormField.dart';
import 'package:ecommercewithfirebase/common/cusotm_widgets/customText.dart';
import 'package:ecommercewithfirebase/view/authentication/login/screen/login_screen.dart';
import 'package:ecommercewithfirebase/view/authentication/login/widgets/cSocialButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/cusotm_widgets/custom_button.dart';
import '../../../../utils/constants/custom_texts_string.dart';
import '../../../../utils/constants/images_strrings.dart';
import '../../emailVerification/screen/email_screen.dart';
import '../widgets/cSignupFormWidgets.dart';
import '../widgets/policytermwidgets.dart';
import '../widgets/signupcreatebuttomwidgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.offAll(LoginScreen());
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomtextWidget(
                title: "Let's Create your account",
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: Get.height * 0.02),
              //forms
              Form(key: _formKey, child: cSignupFormWidgets()),
              // policy and terms
              policytermwidgets(),

              SizedBox(height: Get.height * 0.01),
              //create account
              CustomButton(
                onPressed: () {
                  Get.off(EmailScreen());
                },
                title: CustomTextsString.createAcount,
                fontSize: 20,
              ),
              SizedBox(height: Get.height * 0.04),
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
              SizedBox(height: Get.height * 0.03),

              // socila button
              cSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
