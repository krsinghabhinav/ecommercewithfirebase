import 'package:ecommercewithfirebase/utils/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomShadowStyle {
  static final verticalproductShow = BoxShadow(
    color: CustomColors.dark.withOpacity(0.1),
    spreadRadius: 7,
    offset: Offset(0, 2),
    blurRadius: 50,
  );
  static final horizontalproductShow = BoxShadow(
    color: CustomColors.dark.withOpacity(0.1),
    spreadRadius: 7,
    offset: Offset(0, 2),
    blurRadius: 50,
  );
}
