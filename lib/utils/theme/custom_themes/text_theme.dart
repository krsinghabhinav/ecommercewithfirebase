import 'package:flutter/material.dart';

class CustomTextTheme {
  CustomTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(
      fontSize: 32,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle().copyWith(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle().copyWith(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),

    titleLarge: TextStyle().copyWith(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle().copyWith(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle().copyWith(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),

    bodyLarge: TextStyle().copyWith(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle().copyWith(
      fontSize: 14,
      // ignore: deprecated_member_use
      color: Colors.black.withOpacity(0.5),
      fontWeight: FontWeight.w500,
    ),

    labelLarge: TextStyle().copyWith(
      fontSize: 12,
      // ignore: deprecated_member_use
      color: Colors.black,
      fontWeight: FontWeight.normal,
    ),

    labelMedium: TextStyle().copyWith(
      fontSize: 12,
      // ignore: deprecated_member_use
      color: Colors.black.withOpacity(0.5),
      fontWeight: FontWeight.normal,
    ),
  );
  static TextTheme dartTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(
      fontSize: 32,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle().copyWith(
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle().copyWith(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle().copyWith(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle().copyWith(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle().copyWith(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),

    bodyLarge: TextStyle().copyWith(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle().copyWith(
      fontSize: 14,
      // ignore: deprecated_member_use
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
    ),

    labelLarge: TextStyle().copyWith(
      fontSize: 12,
      // ignore: deprecated_member_use
      color: Colors.white,
      fontWeight: FontWeight.normal,
    ),

    labelMedium: TextStyle().copyWith(
      fontSize: 12,
      // ignore: deprecated_member_use
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.normal,
    ),
  );
}
