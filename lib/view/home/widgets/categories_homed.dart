
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/cusotm_widgets/custom_horizontal_vertica_image_text_categ.dart';
import '../../../utils/constants/custom_colors.dart';

class CategoriesHome extends StatelessWidget {
   CategoriesHome({
    super.key,
    
  });


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
    return Flexible(
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
    );
  }
}
