import 'package:birthday_reminder/constants/colors.dart';
import 'package:birthday_reminder/constants/strings.dart';
import 'package:birthday_reminder/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
 * Created by karthi_rt on 18-08-2025.
 */

class AddBirthdayScreen extends StatefulWidget {
  const AddBirthdayScreen({super.key});

  @override
  State<AddBirthdayScreen> createState() => _AddBirthdayScreenState();
}

class _AddBirthdayScreenState extends State<AddBirthdayScreen> {

  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  DateTime? _dob;

  @override
  Widget build(BuildContext context) {

    @override
    void dispose() {
      _nameCtrl.dispose();
      super.dispose();
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        height: Get.height,
        width: Get.width,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
        child: Column(
          children: [
            Helpers.appHeaderRow(text: AppStrings.addBirthday),
            Helpers.appSizedBox(height: 40),

            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Helpers.appText(text: AppStrings.name, textAlign: TextAlign.start, width: Get.width, margin: const EdgeInsets.only(bottom: 8)),
                    AppTextFormField(
                      controller: _nameCtrl,
                      hintText: AppStrings.enterName,
                      fillColor: AppColors.backgroundSecondary,
                      textCapitalization: TextCapitalization.words,
                      autofillHints: const [AutofillHints.name],
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) return AppStrings.errorEnterName;
                        if (v.trim().length < 2) return 'Name looks too short';
                        return null;
                      },
                    ),
                    Helpers.appSizedBox(height: 26),
                    Helpers.appText(text: AppStrings.dob, textAlign: TextAlign.start, width: Get.width, margin: const EdgeInsets.only(bottom: 12)),
                    AppDateFormField(
                      hintText: AppStrings.selectDate,
                      icon: Icons.event_rounded,
                      initialValue: _dob,
                      fillColor: AppColors.backgroundSecondary,
                      onChanged: (d) => setState(() => _dob = d),
                      validator: (d) {
                        if (d == null) return AppStrings.errorSelectDate;
                        // Example: prevent future dates
                        if (d.isAfter(DateTime.now())) return 'Date cannot be in the future';
                        return null;
                      },
                      firstDate: DateTime(1947),
                      lastDate: DateTime(2025),
                    ),
                    Helpers.appSizedBox(height: 30),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: Helpers.appElevatedButton(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                          onPressed: (){
                            if (_formKey.currentState?.validate() ?? false) {
                              // Do your save
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Saved')),
                              );
                            }
                          },
                          borderRadius: const BorderRadius.all(Radius.circular(36)),
                          label: AppStrings.save, fontSize: 16, foregroundColor: AppColors.white
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}