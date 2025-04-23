import 'dart:async';

import 'package:ecommercewithfirebase/view/home_screen/home_screen.dart';
import 'package:ecommercewithfirebase/view/onboarding/onBoardinScreen/onboarding_screen.dart';
import 'package:flutter/material.dart' show Navigator;
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class SplashScrollController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 5), () {
      // Navigate to your next screen here
      Get.to(OnboardingScreen());
    });
  }
}
