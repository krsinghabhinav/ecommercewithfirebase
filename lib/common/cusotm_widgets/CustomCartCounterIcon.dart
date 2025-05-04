import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'customText.dart';
import '../../utils/constants/custom_colors.dart';

class CustomCartCounterIcon extends StatelessWidget {
  final Color? iconsColor;
  final VoidCallback? onPressed;
  final String? title;
  const CustomCartCounterIcon({super.key, this.iconsColor, this.onPressed, this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(Iconsax.shopping_bag, color: iconsColor),
        ),

        Positioned(
          right: 0,
          child: Container(
            width: Get.width * 0.05,
            height: Get.height * 0.023,
            decoration: BoxDecoration(
              color: CustomColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: CustomtextWidget(
                title: title ?? "",
                fontSize: 10,
                color: CustomColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
