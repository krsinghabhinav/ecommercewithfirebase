import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../controller/splash_controller.dart';
import '../../utils/constants/images_strrings.dart';
import '../../utils/helpers/helper_function.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  SplashScrollController scrollController = Get.put(SplashScrollController());

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    // Define scale animation
    _scaleAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    // Define fade animation
    _fadeAnimation = Tween<double>(
      begin: 0.4,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    // Start the animation
    _controller.forward();

    // Navigate to next screen after 3 seconds (optional)
    // Future.delayed(const Duration(seconds: 3), () {
    //   Get.off(() => const NextScreen());
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: const Color.fromARGB(
        255,
        101,
        101,
        101,
      // ignore: deprecated_member_use
      ).withOpacity(0.8),
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Image.asset( CustomImages.splashImages  ,
              height: CustomHelperFuctions.screenHeight() * 0.7,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
