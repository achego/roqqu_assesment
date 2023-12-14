import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_theme_builder.dart';

class ThemeController extends GetxController {
  final isDarkTheme = false.obs;
//   bool get  isDarkTheme {
// return localStorage.isDarkMode;
//   }

setInitialDarkMode() {
  isDarkTheme.value = false;
}

  
  change(BuildContext context) {
    AppThemeBuilder.of(context).rebuild();
  }

  toogleTheme(BuildContext context) {
    isDarkTheme.toggle();
    change(context);
  }
}
