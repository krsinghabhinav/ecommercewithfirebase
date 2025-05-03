import 'package:ecommercewithfirebase/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/authentication/emailVerification/screen/email_screen.dart';
import 'view/authentication/login/screen/login_screen.dart';
import 'view/authentication/signup/screen/signup_screen.dart';
import 'view/home/home_screen/home_screen.dart';
import 'view/onboarding/onBoardinScreen/onboarding_screen.dart';
import 'view/splash_screen/splash_screen.dart';
import 'test/StudentProfilePage3.dart';
import 'test/StudentProfileScreenPage.dart';
import 'test/student4.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Profile',

      // theme: ThemeData(
      //   primarySwatch: Colors.teal,
      //   fontFamily: 'Poppins',
      //   cardTheme: CardTheme(
      //     elevation: 4,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(16),
      //     ),
      //   ),
      //   // Add more theme customization
      //   appBarTheme: AppBarTheme(
      //     elevation: 0,
      //     backgroundColor: Colors.teal.shade700,
      //   ),
      //   elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ElevatedButton.styleFrom(
      //       backgroundColor: Colors.teal.shade700,
      //       foregroundColor: Colors.white,
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(10),
      //       ),
      //     ),
      //   ),
      // ),
      themeMode: ThemeMode.system,
      darkTheme: CustAppTheme.darkTheme,
      theme: CustAppTheme.lightTheme,
      home: HomeScreen(),
    );
  }
}
