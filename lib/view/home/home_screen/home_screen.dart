import 'package:ecommercewithfirebase/common/cusotm_widgets/customAppBar.dart';
import 'package:ecommercewithfirebase/utils/constants/custom_colors.dart';
import 'package:ecommercewithfirebase/common/cusotm_widgets/curved_edges/curved_edges.dart';
import 'package:ecommercewithfirebase/utils/constants/custom_texts_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/cusotm_widgets/customText.dart';
import '../../../common/cusotm_widgets/CustomCartCounterIcon.dart';
import '../../../common/cusotm_widgets/curved_edges/curvedEdgesWidgets.dart';
import '../../../common/cusotm_widgets/curved_edges/cutomPrimaryHeaderContainer.dart';
import '../../../common/cusotm_widgets/custom_horizontal_vertica_image_text_categ.dart';
import '../../../common/cusotm_widgets/custom_section_heading.dart';
import '../widgets/customCartContainerWidgets.dart';
import '../widgets/custom_home_appbar.dart';
import '../../../common/cusotm_widgets/custom_search_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> categories = [
    {'name': 'Grocery', 'icon': Iconsax.shopping_bag},
    {'name': 'Electronics', 'icon': Iconsax.cpu},
    {'name': 'Fashion', 'icon': Iconsax.shop},
    {'name': 'Home', 'icon': Iconsax.home},
    {'name': 'Beauty', 'icon': Iconsax.magicpen},
    {'name': 'Toys', 'icon': Iconsax.game},
    {'name': 'Books', 'icon': Iconsax.book},
    {'name': 'Fitness', 'icon': Iconsax.activity},
    {'name': 'Stationery', 'icon': Iconsax.pen_add},
    {'name': 'Pet Supplies', 'icon': Iconsax.lovely},
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

                  Flexible(
                    child: ListView.builder(
                      itemCount: categories.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var category = categories[index];
                        return CustomHorizontalVerticalImageText(
                          title: category['name'],
                          icons: category['icon'],
                          textColors: CustomColors.white,
                          onTap: () {
                            print("categories==${category['name']}");
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // const Expanded(child: Placeholder()),
        ],
      ),
    );
  }
}
