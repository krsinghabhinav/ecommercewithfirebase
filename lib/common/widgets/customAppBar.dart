import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? bgColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomAppBar({
    super.key,
    required this.title,
    this.bgColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: fontSize ?? 18,
          color: textColor ?? Colors.white,
          fontWeight: fontWeight ?? FontWeight.bold,
        ),
      ),
      backgroundColor: bgColor ?? Theme.of(context).primaryColor,
      centerTitle: true,
      elevation: 4,
    );
  }
}
