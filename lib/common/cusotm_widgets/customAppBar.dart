import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/custom_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Color? bgColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? showBackButton;
  final VoidCallback? leadingOnPressed;
  final List<Widget>? actions;
  final IconData? leadingIcon;
  final bool? centertext;
  const CustomAppBar({
    super.key,
    required this.title,
    this.bgColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.showBackButton ,
    this.leadingOnPressed,
    this.actions,
    this.leadingIcon,
    this.centertext,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          bgColor ?? Colors.transparent, // make it transparent by default
      automaticallyImplyLeading: false,
      leading:
          showBackButton == true
              ? IconButton(
                icon: const Icon(Icons.arrow_left),
                onPressed:
                    leadingOnPressed ?? () => Navigator.of(context).pop(),
              )
              : leadingIcon != null
              ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
              : null,
      title: title,
      centerTitle: centertext,
      elevation: 0,
      actions: actions,
    );
  }
}
