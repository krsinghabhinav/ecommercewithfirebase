import 'package:ecommercewithfirebase/common/cusotm_widgets/customRoundedContainer.dart';
import 'package:ecommercewithfirebase/common/cusotm_widgets/custom_image_carousels.dart';
import 'package:ecommercewithfirebase/utils/constants/custom_colors.dart';
import 'package:ecommercewithfirebase/utils/constants/images_strrings.dart';
import 'package:ecommercewithfirebase/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

class CustomProductCardVertical extends StatefulWidget {
  const CustomProductCardVertical({super.key});

  @override
  State<CustomProductCardVertical> createState() =>
      _CustomProductCardVerticalState();
}

class _CustomProductCardVerticalState extends State<CustomProductCardVertical> {
  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFuctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: Get.width * 0.46,

        // padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: dark ? Colors.grey[800] : Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            //thumbnail
            Customroundedcontainer(
              height: Get.height * 0.22,
              radius: 18,
              padding: EdgeInsets.all(3),
              backgroundColor: dark ? CustomColors.dark : CustomColors.light,
              child: Stack(
                children: [
                  CustomRoundedImages(
                    applyImagesRadius: true,
                    height: Get.height * 0.22,
                    borderRadius: 18,
                    isNetworkImage: false,
                    fit: BoxFit.cover,
                    imageUrl:
                        "assets/boysshose/7170387a-b3e9-494c-84dc-f0906ca10b7c.jpg",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
