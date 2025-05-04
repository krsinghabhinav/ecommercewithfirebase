import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/helpers/helper_function.dart';
import 'customText.dart';
import '../../utils/constants/custom_colors.dart';

class CustomSearchContainer extends StatelessWidget {
  final String title;
  final IconData icon;
  const CustomSearchContainer({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFuctions.isDarkMode(context);

    return Container(
      margin: const EdgeInsets.all(10),
      height: Get.height * 0.06,
      width: double.infinity,
      decoration: BoxDecoration(
        // color: Colors.grey.shade200,
        color: (dark ? CustomColors.black : CustomColors.white),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: Get.width * 0.01,
          color: (dark ? CustomColors.black : CustomColors.white),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: Get.width * 0.03),
          Icon(
            icon,
            size: Get.width * 0.07,
            color: (dark ? CustomColors.white : CustomColors.buttonSecondary),
          ),
          SizedBox(width: Get.width * 0.03),
          CustomtextWidget(
            title: title,
            color: (dark ? CustomColors.white : CustomColors.buttonSecondary),
            fontSize: Get.width * 0.045,
          ),
        ],
      ),
    );
  }
}
