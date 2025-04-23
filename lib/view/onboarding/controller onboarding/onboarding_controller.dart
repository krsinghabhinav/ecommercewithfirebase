import 'package:ecommercewithfirebase/view/home_screen/home_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var pageController = PageController();
  var currentPageIndex = 0.obs;

  void updatePageIndicator(index) {
    currentPageIndex.value = index;
  }

  void dotNavigationclick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  void skipPage() {
    pageController.jumpToPage(2);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.to(HomeScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }
  // //variable
  // final pageController = PageController();
  // var currentPageIndex = 0.obs;
  // //update current index when page scroll
  // void updatePageIndicator(index) {
  //   currentPageIndex.value = index;
  // }

  // //jump to the  spacific dot se;lected page
  // void dotNavigationclick(index) {
  //   currentPageIndex.value = index;
  //   pageController.jumpTo(index);
  // }

  // //update current index and jump to next page
  // void nextPage() {
  //   if (currentPageIndex.value == 2) {
  //     Get.to(HomeScreen());
  //   } else {
  //     int page = currentPageIndex.value + 1;
  //     pageController.jumpToPage(page);
  //   }
  // }

  // //update current index and jump to the last page
  // void skipPage() {
  //   currentPageIndex.value == 2;
  //   // Get.to(HomeScreen());
  //   pageController.jumpToPage(2);
  // }
}
