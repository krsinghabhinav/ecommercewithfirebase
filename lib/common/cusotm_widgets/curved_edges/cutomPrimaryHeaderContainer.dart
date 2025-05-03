import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/custom_colors.dart';
import '../../../view/home/widgets/customCularContainerWidgets.dart';
import 'curvedEdgesWidgets.dart';

class cutomPrimaryHeaderContainer extends StatelessWidget {
  final Widget? child;
  const cutomPrimaryHeaderContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return curvedEdgesWidgets(
      child: Container(
        color: CustomColors.primaryColor,
        child: Container(
          width: double.infinity,
          height: Get.height * 0.5,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                left: Get.width * 0.5,
                child: customCularContainerWidgets(
                  height: Get.height * 0.45,
                  backgroundColor: CustomColors.textWhite.withOpacity(0.1),
                  radius: Get.height * 0.9,
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                left: Get.width * 0.75,
                child: customCularContainerWidgets(
                  height: Get.height * 0.45,
                  backgroundColor: CustomColors.textWhite.withOpacity(0.1),
                  radius: Get.height * 0.9,
                ),
              ),
              Positioned( 
                
                child: child!),
            ],
          ),
        ),
      ),
    );
  }
}
