import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/custom_colors.dart';

class Customcartcontainerwidgets extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Widget? child;
  final double? radius;
  const Customcartcontainerwidgets({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.child,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: CustomColors.textWhite.withOpacity(0.1),
        borderRadius: BorderRadius.circular(radius ?? 20),
      ),
    );
  }
}
