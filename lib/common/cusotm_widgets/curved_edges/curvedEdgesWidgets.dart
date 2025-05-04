
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/custom_colors.dart';
import '../../../view/home/widgets/customCartContainerWidgets.dart';
import 'curved_edges.dart';

class curvedEdgesWidgets extends StatelessWidget {
  final Widget? child;
  const curvedEdgesWidgets({
    super.key,this.child
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: child,
    );
  }
}
