import 'package:ecommercewithfirebase/common/cusotm_widgets/customAppBar.dart';
import 'package:ecommercewithfirebase/utils/constants/custom_colors.dart';
import 'package:ecommercewithfirebase/common/cusotm_widgets/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/cusotm_widgets/customText.dart';
import '../../../common/cusotm_widgets/CustomCartCounterIcon.dart';
import '../../../common/cusotm_widgets/curved_edges/curvedEdgesWidgets.dart';
import '../../../common/cusotm_widgets/curved_edges/cutomPrimaryHeaderContainer.dart';
import '../widgets/customCularContainerWidgets.dart';
import '../widgets/custom_home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Home', style: TextStyle())),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          cutomPrimaryHeaderContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHomeAppBar(),
              ],
            ),
          ),
          // const Expanded(child: Placeholder()),
        ],
      ),
    );
  }
}
