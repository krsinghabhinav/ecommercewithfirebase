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

class cSocialButton extends StatelessWidget {
  const cSocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              onPressed: () {},
              icon: Image(image: AssetImage(CustomImages.google)),
            ),
          ),
        ),
        SizedBox(width: Get.width * 0.05),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: IconButton(
              onPressed: () {},
              icon: Image(image: AssetImage(CustomImages.facebook)),
            ),
          ),
        ),
      ],
    );
  }
}
