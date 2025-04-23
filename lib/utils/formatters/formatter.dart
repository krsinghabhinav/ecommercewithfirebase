import 'package:intl/intl.dart';

class CustomFormatter {
  /// Returns date in `dd-MMM-yyyy` format
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  /// Returns currency formatted for US (e.g., $1,234.56)
  static String formatCurrencyUSD(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  /// Returns currency formatted for India (e.g., ₹1,23,456.78)
  static String formatCurrencyINR(double amount) {
    return NumberFormat.currency(locale: 'en_IN', symbol: '₹').format(amount);
  }

  /// Returns date and time in `dd-MMM-yyyy hh:mm a` format
  static String formatDateTime(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy hh:mm a').format(date);
  }

  //Your function formats a 10-digit or longer phone number with grouping, but it uses a somewhat US-style format.
  static String formatPhoneNumberUS(String phoneNumber) {
    // Remove any non-digit characters
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (phoneNumber.length == 10) {
      // Example: 9876543210 -> 98765 43210
      return '${phoneNumber.substring(0, 5)} ${phoneNumber.substring(5)}';
    } else if (phoneNumber.length == 11 && phoneNumber.startsWith('0')) {
      // Example: 09876543210 -> 09876 543210
      return '${phoneNumber.substring(0, 5)} ${phoneNumber.substring(5)}';
    } else if (phoneNumber.length == 12 && phoneNumber.startsWith('91')) {
      // Example: 919876543210 -> +91 98765 43210
      return '+91 ${phoneNumber.substring(2, 7)} ${phoneNumber.substring(7)}';
    } else {
      return phoneNumber; // fallback
    }
  }

  //Indian-style version of your formatPhoneNumber function that keeps the grouping familiar to Indian users,
  static String formatPhoneNumberIndia(String phoneNumber) {
    // Remove all non-digit characters
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (phoneNumber.length == 10) {
      // 10-digit mobile number: 9876543210 -> 98765 43210
      return '${phoneNumber.substring(0, 5)} ${phoneNumber.substring(5)}';
    } else if (phoneNumber.length == 11 && phoneNumber.startsWith('0')) {
      // Starts with 0: 09876543210 -> 09876 543210
      return '${phoneNumber.substring(0, 5)} ${phoneNumber.substring(5)}';
    } else if (phoneNumber.length == 12 && phoneNumber.startsWith('91')) {
      // Country code 91: 919876543210 -> +91 98765 43210
      return '+91 ${phoneNumber.substring(2, 7)} ${phoneNumber.substring(7)}';
    } else if (phoneNumber.length == 13 && phoneNumber.startsWith('91')) {
      // For cases like +919876543210
      return '+91 ${phoneNumber.substring(3, 8)} ${phoneNumber.substring(8)}';
    } else {
      // Fallback to original input
      return phoneNumber;
    }
  }

  //Just a small tweak needed: you're not adding the +91 prefix in the default case, so it won't be in international format unless the input already starts with 91.
  static String formatInternationalPhoneNumber(String phoneNumber) {
    // Remove spaces, dashes, parentheses, and other non-digit characters
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Remove leading zero if present (for Indian numbers like 09876543210)
    if (phoneNumber.startsWith('0')) {
      phoneNumber = phoneNumber.substring(1);
    }

    // If it already starts with '91' and is 12 digits long, assume it's correct
    if (phoneNumber.startsWith('91') && phoneNumber.length == 12) {
      return '+$phoneNumber';
    }

    // If it's a 10-digit Indian mobile number, add the +91 prefix
    if (phoneNumber.length == 10) {
      return '+91$phoneNumber';
    }

    // Fallback: assume user entered full number (like 441234567890 for UK)
    return '+$phoneNumber';
  }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove all non-digit characters
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');
    // Add the +91 prefix if it's a 10-digit Indian mobile number
    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);

    final formatteNumber = StringBuffer();
    formatteNumber.write('${countryCode}');

    int i = 0;
    while (i < digitsOnly.length) {
      int groupLength = 2;
      if (i == 0 && countryCode == '+1') {
        groupLength = 3;
      }

      int end = i + groupLength;
      formatteNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length) {
        formatteNumber.write(' ');
      }
      i = end;
    }

    return formatteNumber.toString();
  }
}
