// import 'package:iconsax/iconsax.dart';

// class NavigationBarMenu extends StatefulWidget {
//   const NavigationBarMenu({super.key});

//   @override
//   State<NavigationBarMenu> createState() => _NavigationBarMenuState();
// }

// class _NavigationBarMenuState extends State<NavigationBarMenu> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: NavigationBar(
//         destinations: [
//           NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
//           NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
//           NavigationDestination(icon: Icon(Iconsax.heart), label: "Wishlist"),
//           NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
//         ],
//       ),
//     );
//   }
// }

import 'dart:ffi';

import 'package:ecommercewithfirebase/utils/constants/custom_colors.dart';
import 'package:ecommercewithfirebase/utils/helpers/helper_function.dart';
import 'package:ecommercewithfirebase/view/shop/storeshop_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

import '../../view/home/home_screen/home_screen.dart';
import '../../view/profile/screen/profile_screen.dart';
import '../../view/wishlist/screen/wishlist_Screen.dart';

class NavigationBarMenu extends StatefulWidget {
  const NavigationBarMenu({super.key});

  @override
  State<NavigationBarMenu> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<NavigationBarMenu> {
  NavigationController navigationController = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    final darkMode = CustomHelperFuctions.isDarkMode(context);
    return Scaffold(
      body: Obx(
        () =>
            navigationController.pages[navigationController
                .selectedIndex
                .value],
      ),

      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: navigationController.selectedIndex.value,
          height: Get.height * 0.08,
          elevation: 0,
          // backgroundColor: darkMode ? CustomColors.white : CustomColors.black,
          // indicatorColor:
          //     darkMode
          //         ? CustomColors.white.withOpacity(0.1)
          //         : CustomColors.black.withOpacity(0.1),
          onDestinationSelected: (index) {
            navigationController.selectedIndex.value = index;
          },
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
            NavigationDestination(icon: Icon(Iconsax.heart), label: "Wishlist"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;

  final RxList<Widget> pages =
      [
        const HomeScreen(),
        const StoreshopScreen(),
        const WishlistScreen(),
        const ProfileScreen(),
      ].obs;
}
