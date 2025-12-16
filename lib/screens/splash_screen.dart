import 'package:birthday_reminder/constants/colors.dart';
import 'package:birthday_reminder/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../routes/app_routes.dart';
/**
 * Created by karthi_rt on 18-08-2025.
 */

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 50.0,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w900,
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1600), () {
      Get.offNamed(AppRoutes.welcome);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                AppStrings.appTitle,
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
                textAlign: TextAlign.center
          ),
        ]),
      ),
    );
  }
}