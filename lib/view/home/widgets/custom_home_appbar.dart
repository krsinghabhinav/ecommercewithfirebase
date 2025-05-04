import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/cusotm_widgets/CustomCartCounterIcon.dart';
import '../../../common/cusotm_widgets/customAppBar.dart';
import '../../../common/cusotm_widgets/customText.dart';
import '../../../utils/constants/custom_colors.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomtextWidget(
            title: "Good day for shopping",
            fontSize: 12,
            color: CustomColors.white,
          ),
          CustomtextWidget(
            title: "Abhinav Kumar Singh",
            color: CustomColors.white,
          ),
        ],
      ),
      bgColor: Colors.transparent,
      actions: [
        CustomCartCounterIcon(
          title: "99",
          onPressed: () {
            print("cart increses ");
          },
          iconsColor: CustomColors.white,
        ),
        SizedBox(width: Get.width * 0.02),
      ], // or remove this line now since default is transparent
    );
  }
}
