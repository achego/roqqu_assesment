import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme_controller.dart';

class AppThemeColor {
  final isDark = Get.put(ThemeController()).isDarkTheme.value;
  Color get primary => isDark ? Colors.white : Colors.black;
}

class AppColors {
  // Theme Colors
  final isDark = Get.put(ThemeController()).isDarkTheme.value;

  Color get primaryR => isDark ? AppColorsDark.primary : primary;

  // Static Colors
  static const Color background = Color.fromRGBO(241, 241, 241, 1);
  static const Color bgFaint = Color.fromRGBO(238, 238, 240, 1);
  static const Color primary = Color.fromRGBO(39, 67, 253, 1);
  static const Color primaryLight = Color.fromRGBO(201, 208, 255, 1);
  static const Color textDark = Color.fromRGBO(28, 33, 39, 1);
  static const Color secondaryDark = Color.fromRGBO(115, 122, 145, 1);
  static const Color textLight = Color.fromRGBO(115, 122, 145, 1);
  static const Color lightCard = Color.fromRGBO(241, 241, 241, 1);
  static const Color green = Color.fromRGBO(0, 192, 118, 1);
  static const Color white = Colors.white;

// Swatch
  static const MaterialColor primarySwatch = MaterialColor(
    0xff005259, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffce5641), //10%
      100: Color(0xffb74c3a), //20%
      200: Color(0xffa04332), //30%
      300: Color(0xff89392b), //40%
      400: Color(0xff733024), //50%
      500: Color(0xff5c261d), //60%
      600: Color(0xff451c16), //70%
      700: Color(0xff2e130e), //80%
      800: Color(0xff170907), //90%
      900: Color(0xff000000), //100%
    },
  );
}

class AppColorsDark {
  static const Color background = Color.fromRGBO(2, 39, 43, 1);
  static const Color statusBar = Color.fromRGBO(13, 27, 19, 0.07);
  static const Color primary = Color.fromRGBO(0, 160, 173, 1);
  static const Color primary40 = Color.fromRGBO(214, 252, 255, 1);
  static const Color gray40 = Colors.white;
  static const Color gray30 = Color.fromRGBO(160, 171, 187, 1);
  static const Color ghostText = Color.fromRGBO(160, 171, 187, 1);
  static const Color darkText = Color.fromRGBO(231, 234, 238, 1);
  static const Color headingDark = Color.fromRGBO(231, 234, 238, 1);
  static const Color error = Color.fromRGBO(239, 68, 68, 1);
  static const Color white = Color.fromRGBO(0, 51, 56, 1);
}
