import 'package:ecommercewithfirebase/utils/constants/custom_colors.dart';
import 'package:ecommercewithfirebase/utils/helpers/helper_function.dart';
import 'package:ecommercewithfirebase/utils/http/http_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customText.dart';

class CustomHorizontalVerticalImageText extends StatelessWidget {
  final String? title;
  final IconData? icons;
  final String? image;
  final Color? bgColors;
  final Color? textColors;
  final VoidCallback? onTap;
  const CustomHorizontalVerticalImageText({
    super.key,
    this.title,
    this.icons,
    this.bgColors,
    this.image,
    this.onTap,
    this.textColors,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFuctions.isDarkMode(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: Get.height * 0.07,
              width: Get.width * 0.16,
              decoration: BoxDecoration(
                color:
                    bgColors ??
                    (dark ? CustomColors.black : CustomColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child:
                  icons != null
                      ? Icon(
                        icons,
                        color: (dark ? CustomColors.white : CustomColors.black),
                      )
                      : null,
            ),
          ),
        ),
        CustomtextWidget(
          title: title ?? "",
          fontSize: Get.width * 0.033,
          color: textColors,
        ),
      ],
    );
  }
}
