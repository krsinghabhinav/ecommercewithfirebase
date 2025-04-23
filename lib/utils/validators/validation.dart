import 'package:get/get.dart';

class CustomValidation {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    // Check if the password contains at least one uppercase letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check if the password contains at least one lowercase letter
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    // Check if the password contains at least one digit
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit';
    }

    // Check if the password contains at least one special character (e.g., !, @, #, etc.)
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    // Check the password length (at least 8 characters)
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    return null; // Return null if all validations pass
  }

 static String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your phone number';
  }

  // Check if the phone number contains exactly 10 digits
  if (!RegExp(r'^\d{10}$').hasMatch(value)) {
    return 'Please enter a valid 10-digit phone number';
  }

  return null; // Return null if the phone number is valid
}

}
