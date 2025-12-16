import 'package:birthday_reminder/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import '../utils/helpers.dart';

/**
 * Created by karthi_rt on 20-08-2025.
 */

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
          child: Column(
            children: [
              Helpers.appHeaderRow(text: AppStrings.notifications, leadingIcon: Icons.arrow_back, onLeadingTap: () => Get.offNamed(AppRoutes.mainScreen, arguments: 2),),
              Helpers.appSizedBox(height: 40),
              Helpers.appText(text: AppStrings.reminders, fontSize: 18, fontWeight: FontWeight.bold, textAlign: TextAlign.start, width: Get.width, margin: const EdgeInsets.only(bottom: 16)),
              Helpers.appSwitchRow(title: AppStrings.birthdayReminders, subtitle: AppStrings.twoDaysBefore, value: light, onChanged: (bool value) {setState(() {light = value;});},),

              Helpers.appText(text: AppStrings.reminderTime, fontSize: 18, fontWeight: FontWeight.bold, textAlign: TextAlign.start, width: Get.width, margin: const EdgeInsets.only(bottom: 8, top: 30)),
              Helpers.notificationWidgetTwo(labelText: AppStrings.daysBefore, valueText: AppStrings.two),
              Helpers.notificationWidgetTwo(labelText: AppStrings.time, valueText: AppStrings.nineAM),

              Helpers.appText(text: AppStrings.sound, fontSize: 18, fontWeight: FontWeight.bold, textAlign: TextAlign.start, width: Get.width, margin: const EdgeInsets.only(bottom: 8, top: 24)),
              Helpers.notificationWidgetTwo(labelText: AppStrings.sound, valueText: AppStrings.defaults),
              Helpers.appSwitchRow(title: AppStrings.defaults, value: light, onChanged: (bool value) {setState(() {light = value;});},
              ),
            ],
          ),
        ),
      ),
    );
  }
}