import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommercewithfirebase/common/cusotm_widgets/customAppBar.dart';
import 'package:ecommercewithfirebase/utils/constants/custom_colors.dart';
import 'package:ecommercewithfirebase/common/cusotm_widgets/curved_edges/curved_edges.dart';
import 'package:ecommercewithfirebase/utils/constants/custom_texts_string.dart';
import 'package:ecommercewithfirebase/utils/constants/images_strrings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/cusotm_widgets/customText.dart';
import '../../../common/cusotm_widgets/CustomCartCounterIcon.dart';
import '../../../common/cusotm_widgets/curved_edges/curvedEdgesWidgets.dart';
import '../../../common/cusotm_widgets/curved_edges/cutomPrimaryHeaderContainer.dart';
import '../../../common/cusotm_widgets/custom_circular_container.dart';
import '../../../common/cusotm_widgets/custom_horizontal_vertica_image_text_categ.dart';
import '../../../common/cusotm_widgets/custom_image_carousels.dart';
import '../../../common/cusotm_widgets/custom_section_heading.dart';
import '../widgets/categories_homed.dart';
import '../widgets/customCartContainerWidgets.dart';
import '../widgets/custom_home_appbar.dart';
import '../../../common/cusotm_widgets/custom_search_container.dart';
import '../widgets/promo_slider_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> bannerImages = [
    'assets/banners/banner1.jpg',
    'assets/banners/banner2.jpg',
    'assets/banners/banner3.jpg',
    'assets/banners/banner5.jpeg',
    'assets/banners/banner6.jpeg',
    'assets/banners/banner7.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Home', style: TextStyle())),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          cutomPrimaryHeaderContainer(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //custom appbar
                  CustomHomeAppBar(),
                  //searchbar
                  CustomSearchContainer(
                    title: CustomTextsString.searchtext,
                    icon: Icons.search,
                  ),
                  //categories
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),

                    child: Column(
                      children: [
                        CustomSectionheading(
                          title: "Populer Categories",
                          buttontitle: "buttontitle",
                          showActionButton: false,
                          textColor: CustomColors.white,
                        ),
                      ],
                    ),
                  ),
                  //CATEGORIES
                  CategoriesHome(),

                  //carousel slider
                ],
              ),
            ),
          ),
          // const Expanded(child: Placeholder()),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: PromoSliderWidgets(bannerImages: bannerImages),
          ),
        ],
      ),
    );
  }
}
