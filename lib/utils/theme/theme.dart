import 'package:ecommercewithfirebase/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:ecommercewithfirebase/utils/theme/custom_themes/chip_theme.dart';
import 'package:ecommercewithfirebase/utils/theme/custom_themes/customBottomsheet_theme.dart';
import 'package:ecommercewithfirebase/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:ecommercewithfirebase/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:ecommercewithfirebase/utils/theme/custom_themes/text_filed_theme.dart';
import 'package:ecommercewithfirebase/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

import 'custom_themes/appbar_theme.dart';

class CustAppTheme {
  CustAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: CustomTextTheme.lightTextTheme,
    appBarTheme: CustAppBarTheme.lightAppBarTheme,
    checkboxTheme: CustomCheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: CustombottomsheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: CustElevetedButtonTheme.lightElevetedButtonTheme,
    outlinedButtonTheme: CustomOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: CustomTextFiledTheme.lightInputDecorationTheme,
    chipTheme: CustomChipTheme.lightChipTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: CustomTextTheme.dartTextTheme,
    appBarTheme: CustAppBarTheme.darkAppBarTheme,
    checkboxTheme: CustomCheckBoxTheme.darkCheckboxTheme,
    bottomSheetTheme: CustombottomsheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: CustElevetedButtonTheme.darkElevetedButtonTheme,
    outlinedButtonTheme: CustomOutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: CustomTextFiledTheme.darkInputDecorationTheme,
    chipTheme: CustomChipTheme.darkChipTheme,
  );
}
