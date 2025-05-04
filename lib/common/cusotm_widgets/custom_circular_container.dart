import 'package:flutter/material.dart';

class CustomCircularContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Color? bgColor;

  CustomCircularContainer({
    super.key,

    this.bgColor,
    this.width,
    this.height,
    this.radius,
    this.padding,
    this.margin,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.zero,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(radius ?? 0),
      ),
      child: child,
    );
  }
}
