import 'package:birthday_reminder/constants/image_paths.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import '../utils/helpers.dart';

/**
 * Created by karthi_rt on 18-08-2025.
 */

class BirthdayListScreen extends StatefulWidget {
  const BirthdayListScreen({super.key});

  @override
  State<BirthdayListScreen> createState() => _BirthdayListScreenState();
}

class _BirthdayListScreenState extends State<BirthdayListScreen> {

  List<Map<String, String>> birthdaysData = [
    {'image': AppImagePaths.sophia, 'name': 'Sophia Carter', 'dob': 'July 15, 1990'},
    {'image': AppImagePaths.ethan, 'name': 'Ethan Bennett', 'dob': 'August 22, 1985'},
    {'image': AppImagePaths.olivia, 'name': 'Olivia Hayes', 'dob': 'September 5, 1992'},
    {'image': AppImagePaths.noah, 'name': 'Noah Thompson', 'dob': 'October 10, 1988'},
    {'image': AppImagePaths.ava, 'name': 'Ava Mitchell', 'dob': 'November 18, 1995'},
    {'image': AppImagePaths.liam, 'name': 'Liam Foster', 'dob': 'December 2, 1980'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Helpers.appSizedBox(height: 48),
            Helpers.appHeaderRow(text: AppStrings.birthdays),
            Helpers.appSizedBox(height: 40),
            AppTextFormField(
              controller: null,
              hintText: AppStrings.searchBirthdays,
              fillColor: AppColors.backgroundSecondary,
              autofillHints: const [AutofillHints.name],
              prefixIcon: Icons.search,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return AppStrings.errorEnterName;
                return null;
              },
            ),

            Expanded(
                child: ListView.builder(
                    itemCount: birthdaysData.length,
                    // shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListBirthdays(birthData: birthdaysData[index]);
                    }
                )
            )
          ],
        ),
      ),
    );
  }
}

class ListBirthdays extends StatelessWidget {
  final Map<String, String> birthData;
  const ListBirthdays({super.key, required this.birthData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          CircleAvatar(radius: 30, backgroundImage: AssetImage(birthData['image']!),),
          Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Helpers.appText(text: birthData['name'], fontWeight: FontWeight.bold, fontSize: 16, textAlign: TextAlign.start, color: AppColors.textPrimary,),
                    Helpers.appText(text: birthData['dob'], fontSize: 14, textAlign: TextAlign.start, color: AppColors.textSecondary,),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}