import 'package:advanced_salomon_bottom_bar/advanced_salomon_bottom_bar.dart';
import 'package:birthday_reminder/constants/colors.dart';
import 'package:birthday_reminder/constants/strings.dart';
import 'package:birthday_reminder/screens/add_birthday_screen.dart';
import 'package:birthday_reminder/screens/birthday_list_screen.dart';
import 'package:birthday_reminder/screens/settings_screen.dart';
import 'package:birthday_reminder/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
 * Created by karthi_rt on 18-08-2025.
 */

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const BirthdayListScreen(),
    const AddBirthdayScreen(),
    const SettingsScreen(),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = Get.arguments as int?;
    if (args != null) {
      setState(() {
        _currentIndex = args;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(_currentIndex == 0) return true;
        setState(() {
          _currentIndex = 0;
        });
        return false;
      },
      child: Scaffold(
        body: _pages[_currentIndex],

        bottomNavigationBar: AdvancedSalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            AdvancedSalomonBottomBarItem(
                icon: const Icon(Icons.list),
                title: Helpers.appText(text: AppStrings.birthdayList),
                selectedColor: AppColors.primary
            ),
            AdvancedSalomonBottomBarItem(
                icon: const Icon(Icons.add),
                title: Helpers.appText(text: AppStrings.addBirthday),
                selectedColor: AppColors.primary
            ),
            AdvancedSalomonBottomBarItem(
                icon: const Icon(Icons.settings),
                title: Helpers.appText(text: AppStrings.settings),
                selectedColor: AppColors.primary
            ),
          ],
        ),
      ),
    );
  }
}