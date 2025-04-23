// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomCheckBoxTheme {
  CustomCheckBoxTheme._();

  // light theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    // ignore: body_might_complete_normally_nullable
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.white;
      } else {
        return Colors.black;
      }
    }),

    fillColor: MaterialStateProperty.resolveWith((status) {
      if (status.contains(MaterialState.selected)) {
        return Colors.blue;
      } else {
        return Colors.transparent;
      }
    }),
  );

  // dark theme
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    // ignore: body_might_complete_normally_nullable
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.white;
      } else {
        return Colors.black;
      }
    }),

    fillColor: MaterialStateProperty.resolveWith((status) {
      if (status.contains(MaterialState.selected)) {
        return Colors.blue;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
