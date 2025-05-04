import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customText.dart';

class CustomSectionheading extends StatelessWidget {
  final String title;
  final bool? showActionButton;
  final Color? textColor;
  final String? buttontitle;
  final VoidCallback? onPressed;
  CustomSectionheading({
    super.key,
    required this.title,
    this.showActionButton = true,
    this.textColor = Colors.black,
    this.onPressed,
    this.buttontitle = 'View all',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomtextWidget(
          title: title,
          fontSize: Get.width * 0.048,
          fontWeight: FontWeight.w500,
          textOverflow: TextOverflow.ellipsis,
          maxline: 1,
          color: textColor,
        ),
        if (showActionButton!)
          TextButton(
            onPressed: onPressed,
            child: CustomtextWidget(
              fontSize: Get.width * 0.035,
              title: buttontitle ?? "",
              color: textColor,
            ),
          ),
      ],
    );
  }
}
