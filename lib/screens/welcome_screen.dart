import 'package:birthday_reminder/constants/colors.dart';
import 'package:birthday_reminder/constants/image_paths.dart';
import 'package:birthday_reminder/constants/strings.dart';
import 'package:birthday_reminder/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';

/**
 * Created by karthi_rt on 18-08-2025.
 */

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
                child: Column(
                  children: [
                    Helpers.appSizedBox(height: 48),
                    Helpers.appText(text: AppStrings.welcomeText, fontSize: 28, fontWeight: FontWeight.bold, textAlign: TextAlign.center),
                    Helpers.appSizedBox(height: 18),
                    Helpers.appText(text: AppStrings.welcomeDescription, fontSize: 16, textAlign: TextAlign.center),

                    SvgPicture.asset(AppImagePaths.birthdayCandles, height: Get.height/2, width: Get.width, fit: BoxFit.contain,)
                  ],
                )
            ),

            Helpers.appElevatedButton(
                width: Get.width,
                padding: const EdgeInsets.all(12),
                onPressed: (){
                  Future.delayed(const Duration(milliseconds: 600), () {
                    Get.offNamed(AppRoutes.mainScreen);
                  });
                },
                borderRadius: const BorderRadius.all(Radius.circular(36)),
                label: AppStrings.getStarted, fontSize: 16, fontWeight: FontWeight.bold, foregroundColor: AppColors.white
            ),
          ],
        ),
      ),
    );
  }
}