import 'dart:developer';

import 'package:birthday_reminder/constants/image_paths.dart';
import 'package:birthday_reminder/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import '../utils/helpers.dart';

/**
 * Created by karthi_rt on 18-08-2025.
 */

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
          child: Column(
            children: [
              Helpers.appText(text: AppStrings.settings, width: Get.width, fontSize: 20, fontWeight: FontWeight.bold, textAlign: TextAlign.center),
              Helpers.appSizedBox(height: 40),
              Helpers.appText(text: AppStrings.account, fontSize: 18, fontWeight: FontWeight.bold, textAlign: TextAlign.start, width: Get.width, margin: const EdgeInsets.only(bottom: 12)),
              Helpers.appAccountRow(title: AppStrings.account, subtitle: AppStrings.descriptionAccount, svgPath: AppImagePaths.account),
              Helpers.appAccountRow(title: AppStrings.personalInfo, subtitle: AppStrings.descriptionPersonalInfo, svgPath: AppImagePaths.info),
        
              Helpers.appText(text: AppStrings.preferences, fontSize: 18, fontWeight: FontWeight.bold, textAlign: TextAlign.start, width: Get.width, margin: const EdgeInsets.only(bottom: 12, top: 8)),
              Helpers.appAccountRow(title: AppStrings.notifications, subtitle: AppStrings.descriptionNotifications, svgPath: AppImagePaths.notification, onTap: () {Get.toNamed(AppRoutes.notification); log("Notificatin Pressed");}),
              Helpers.appAccountRow(title: AppStrings.appearance, subtitle: AppStrings.descriptionAppearance, svgPath: AppImagePaths.appearance),
        
              Helpers.appText(text: AppStrings.support, fontSize: 18, fontWeight: FontWeight.bold, textAlign: TextAlign.start, width: Get.width, margin: const EdgeInsets.only(bottom: 12, top: 8)),
              Helpers.appAccountRow(title: AppStrings.help, subtitle: AppStrings.descriptionHelp, svgPath: AppImagePaths.help),
              Helpers.appAccountRow(title: AppStrings.feedback, subtitle: AppStrings.descriptionFeedback, svgPath: AppImagePaths.feedback),
              Helpers.appAccountRow(title: AppStrings.about, subtitle: AppStrings.descriptionAbout, svgPath: AppImagePaths.about),
            ],
          ),
        ),
      ),
    );
  }
}