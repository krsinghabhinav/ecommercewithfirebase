import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommercewithfirebase/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/cusotm_widgets/custom_circular_container.dart';
import '../../../common/cusotm_widgets/custom_image_carousels.dart';
import '../../../utils/constants/custom_colors.dart';

class PromoSliderWidgets extends StatelessWidget {
  const PromoSliderWidgets({super.key, required this.bannerImages});

  final List<String> bannerImages;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items:
              bannerImages.map((imagePath) {
                return CustomRoundedImagesCarousel(
                  imageUrl: imagePath,
                  borderRadius: 15,
                  width: double.infinity,
                  height: Get.height * 0.25,
                  fit: BoxFit.fill,
                  applyImagesRadius: true,
                  isNetworkImage: false,
                  onPressed: () {
                    print("Image slider tapped: $imagePath");
                  },
                );
              }).toList(),
          options: CarouselOptions(
            height: Get.height * 0.25,
            // autoPlayAnimationDuration: Duration(milliseconds: 3),
            autoPlay: true,
            // autoPlayInterval: Duration(milliseconds: 1),
            reverse: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: (index, _) => homeController.updateIndex(index),
          ),
        ),
        SizedBox(height: Get.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 1; i <= bannerImages.length; i++)
              Obx(
                () => CustomCircularContainer(
                  height: Get.height * 0.01,
                  width: Get.width * 0.07,
                  bgColor:
                      homeController.carousalCurrentIndex.value == i
                          ? CustomColors.primaryColor
                          : Colors.grey,
                  radius: 5,
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(0),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
