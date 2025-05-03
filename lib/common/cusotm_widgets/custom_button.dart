import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'customText.dart'; // Adjust import based on your structure

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? fontSize;
  final Color? color;
  final double? height;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.fontSize,
    this.color,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Get.height * 0.06,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Theme.of(context).primaryColor,
        ),
        onPressed: onPressed,
        child: CustomtextWidget(
          title: title,
          fontSize: fontSize!,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
