import 'package:birthday_reminder/screens/birthday_list_screen.dart';
import 'package:birthday_reminder/screens/main_screen.dart';
import 'package:birthday_reminder/screens/notification_screen.dart';
import 'package:birthday_reminder/screens/settings_screen.dart';
import 'package:get/get.dart';
import 'package:birthday_reminder/screens/splash_screen.dart';
import '../screens/add_birthday_screen.dart';
import '../screens/welcome_screen.dart';

/**
 * Created by karthi_rt on 18-08-2025.
 */

class AppRoutes {
  static const String splash = '/splash';
  static const String welcome = '/welcome';
  static const String mainScreen = '/mainScreen';
  static const String birthdayList = '/birthdayList';
  static const String addBirthday = '/addBirthday';
  static const String settings = '/settings';
  static const String notification = '/notification';

  static final List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: welcome, page: () => const WelcomeScreen(), transition: Transition.rightToLeft,),
    GetPage(name: mainScreen, page: () => const MainScreen(), transition: Transition.rightToLeft,),
    GetPage(name: birthdayList, page: () => const BirthdayListScreen(), transition: Transition.rightToLeft,),
    GetPage(name: addBirthday, page: () => const AddBirthdayScreen(), transition: Transition.rightToLeft,),
    GetPage(name: settings, page: () => const SettingsScreen(), transition: Transition.rightToLeft,),
    GetPage(name: notification, page: () => const NotificationScreen(), transition: Transition.rightToLeft,),
  ];
}