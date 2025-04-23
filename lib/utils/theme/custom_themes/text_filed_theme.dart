import 'package:flutter/material.dart';

class CustomTextFiledTheme {
  CustomTextFiledTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: TextStyle().copyWith(fontSize: 14, color: Colors.black),
    hintStyle: TextStyle().copyWith(fontSize: 14, color: Colors.black),
    border: OutlineInputBorder().copyWith(
      borderSide: BorderSide(color: Colors.grey, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    floatingLabelStyle: TextStyle().copyWith(
      // ignore: deprecated_member_use
      color: Colors.black.withOpacity(0.8),
    ),

    enabledBorder: OutlineInputBorder().copyWith(
      borderSide: BorderSide(color: Colors.grey, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder().copyWith(
      borderSide: BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    errorBorder: OutlineInputBorder().copyWith(
      borderSide: BorderSide(color: Colors.red, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: OutlineInputBorder().copyWith(
      borderSide: BorderSide(color: Colors.orange, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
  );
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: TextStyle().copyWith(fontSize: 14, color: const Color.fromARGB(255, 255, 255, 255)),
    hintStyle: TextStyle().copyWith(fontSize: 14, color: const Color.fromARGB(255, 255, 255, 255)),
    border: OutlineInputBorder().copyWith(
      borderSide: BorderSide(color: Colors.grey, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    floatingLabelStyle: TextStyle().copyWith(
      // ignore: deprecated_member_use
      color: const Color.fromARGB(255, 251, 251, 251).withOpacity(0.8),
    ),

    enabledBorder: OutlineInputBorder().copyWith(
      borderSide: BorderSide(color: Colors.grey, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder().copyWith(
      borderSide: BorderSide(color: Colors.white, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    errorBorder: OutlineInputBorder().copyWith(
      borderSide: BorderSide(color: Colors.red, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: OutlineInputBorder().copyWith(
      borderSide: BorderSide(color: Colors.orange, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}
