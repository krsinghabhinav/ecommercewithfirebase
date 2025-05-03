
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/cusotm_widgets/CustomeTextFormField.dart';
import '../../../../utils/constants/custom_texts_string.dart';

class cSignupFormWidgets extends StatelessWidget {
  const cSignupFormWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: CustomeTextFormField(
                controller: TextEditingController(),
                prefixIcon: Icon(Iconsax.user),
                labelText: CustomTextsString.firstName,
              ),
            ),
            SizedBox(width: Get.width * 0.03),
            Expanded(
              child: CustomeTextFormField(
                controller: TextEditingController(),
                prefixIcon: Icon(Iconsax.user),
                labelText: CustomTextsString.lastName,
              ),
            ),
          ],
        ),
        SizedBox(height: Get.height * 0.02),
        CustomeTextFormField(
          controller: TextEditingController(),
          prefixIcon: Icon(Iconsax.user_edit),
          labelText: CustomTextsString.username,
        ),
        SizedBox(height: Get.height * 0.02),
        CustomeTextFormField(
          controller: TextEditingController(),
          prefixIcon: Icon(Iconsax.direct),
          labelText: CustomTextsString.email,
        ),
        SizedBox(height: Get.height * 0.02),
        CustomeTextFormField(
          controller: TextEditingController(),
          prefixIcon: Icon(Iconsax.call),
          labelText: CustomTextsString.phonenumber,
        ),
        SizedBox(height: Get.height * 0.02),
        CustomeTextFormField(
          controller: TextEditingController(),
          prefixIcon: Icon(Iconsax.password_check),
          labelText: CustomTextsString.pass,
        ),
      ],
    );
  }
}
