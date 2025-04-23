import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

class CustomHelperFuctions {
  static Color? getColor(String value) {
    value = value.trim().toLowerCase();

    if (value == 'green') {
      return Colors.green;
    } else if (value == 'red') {
      return Colors.red;
    } else if (value == 'blue') {
      return Colors.blue;
    } else if (value == 'yellow') {
      return Colors.yellow;
    } else if (value == 'purple') {
      return Colors.purple;
    } else if (value == 'orange') {
      return Colors.orange;
    } else if (value == 'pink') {
      return Colors.pink;
    } else if (value == 'brown') {
      return Colors.brown;
    } else if (value == 'grey' || value == 'gray') {
      return Colors.grey;
    } else if (value == 'black') {
      return Colors.black;
    } else if (value == 'white') {
      return Colors.white;
    } else if (value == 'transparent') {
      return Colors.transparent;
    } else if (value == 'cyan') {
      return Colors.cyan;
    } else if (value == 'teal') {
      return Colors.teal;
    } else if (value == 'indigo') {
      return Colors.indigo;
    } else if (value == 'lime') {
      return Colors.lime;
    } else if (value == 'amber') {
      return Colors.amber;
    } else if (value == 'deeporange' || value == 'deep orange') {
      return Colors.deepOrange;
    } else if (value == 'deeppurple' || value == 'deep purple') {
      return Colors.deepPurple;
    } else if (value == 'lightblue' || value == 'light blue') {
      return Colors.lightBlue;
    } else if (value == 'lightgreen' || value == 'light green') {
      return Colors.lightGreen;
    } else if (value == 'bluegrey' || value == 'blue grey') {
      return Colors.blueGrey;
    }

    return null; // fallback
  }

  // static void showSnackBar(String message) {
  //     ScaffoldMessenger.of(
  //       Get.context!,
  //     ).showSnackBar(SnackBar(content: Text(message)));

  static void showSnackBar(
    String message, {
    Color? colors,
    Color backgroundColor = Colors.black,
    Duration duration = const Duration(seconds: 1),
  }) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: colors ?? Colors.white)),
         backgroundColor: backgroundColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  // static void showAlter(String title, String message) {
  //   showDialog(
  //     context: Get.context!,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text(title),
  //         content: Text(message),
  //         actions: [TextButton(onPressed: () {}, child: Text('OK'))],
  //       );
  //     },
  //   );
  // }

  static void showAlert({
    required String title,
    required String message,
    String buttonText = "OK",
    VoidCallback? onButtonPressed,
    Color buttonColor = Colors.blue,
    Color backgroundColor = Colors.white,
    double borderRadius = 12.0,
  }) {
    showDialog(
      context: Get.context!,
      barrierDismissible:
          false, // Prevent dialog from closing by tapping outside
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            message,
            style: TextStyle(color: Colors.black.withOpacity(0.7)),
          ),
          backgroundColor: backgroundColor,
          actions: [
            TextButton(
              onPressed: () {
                if (onButtonPressed != null) {
                  onButtonPressed();
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Text(buttonText, style: TextStyle(color: buttonColor)),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreenGetx(Widget screen) {
    Get.to(screen);
  }

  static void navigateToScreenMaterial(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}' + "...";
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }
static double screenHeightWithGet(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(
    DateTime date, {
    String format = "dd MMM yyyy",
  }) {
    return DateFormat(format).format(date);
  }

  // static List<T> removeDuplicates<T>(List<T> list){
  //   return list.toSet().toList();
  // }

  static List<T> removeDuplicates<T>(List<T>? list) {
    if (list == null) return []; // Return an empty list if the input is null
    return list.toSet().toList(); // Remove duplicates while retaining order
  }

  // static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
  //   final wrappedList = <Widget>[];
  //   for (var i = 0; i < widgets.length; i += rowSize) {
  //     final rowChildren = widgets.sublist(
  //       i,
  //       i + rowSize > widgets.length ? widgets.length : i + rowSize,
  //     );
  //     wrappedList.add(Row(children: rowChildren));
  //   }
  //   return wrappedList;
  // }

  // Wrap widgets into rows with a maximum of `rowSize` widgets in each row
  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[]; // List to hold rows

    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(i, min(i + rowSize, widgets.length));
      wrappedList.add(Row(children: rowChildren)); // Add row to the list
    }

    return wrappedList; // Return the wrapped rows
  }
}
