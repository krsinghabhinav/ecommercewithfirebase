import 'package:ecommercewithfirebase/utils/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class Customroundedcontainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final Widget? child;
  final bool showBorder;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? borderWidth;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const Customroundedcontainer({
    super.key,
    this.height,
    this.width,
    this.radius,
    this.child,
    this.showBorder = false,
    this.borderColor,
    this.backgroundColor,
    this.borderWidth = 1.0,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? CustomColors.white,
        borderRadius: BorderRadius.circular(radius ?? 0),
        border:
            showBorder
                ? Border.all(color: borderColor ?? CustomColors.borderPrimary)
                : null,
      ),
      child: child,
    );
  }
}
