import 'package:flutter/material.dart';

class CustAppBarTheme {
  CustAppBarTheme._();
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    backgroundColor: Colors.transparent,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: 24),
    titleTextStyle: TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    actionsIconTheme: IconThemeData(color: Colors.black, size: 24),
  );




  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    backgroundColor: Colors.transparent,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: 24),
    titleTextStyle: TextStyle(
      fontSize: 18,
      color: Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.w600,
    ),
    actionsIconTheme: IconThemeData(color: Colors.black, size: 24),
  );
}
