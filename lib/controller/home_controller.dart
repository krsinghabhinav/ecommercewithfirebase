import 'package:get/get.dart';

class HomeController extends GetxController {
  final carousalCurrentIndex = 0.obs;

  void updateIndex(index) {
    carousalCurrentIndex.value = index;
  }
}
