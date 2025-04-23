import 'package:flutter/material.dart';

class CustombottomsheetTheme {
  CustombottomsheetTheme._();

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: Colors.white,
    showDragHandle: true,
    modalBackgroundColor: Colors.white,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );
  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: Colors.black,
    showDragHandle: true,
    modalBackgroundColor: Colors.black,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );
}
