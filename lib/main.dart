import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roqqu_assesment/app/modules/home_module/home_page.dart';
import 'package:roqqu_assesment/core/theme/app_theme_builder.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 932),
        minTextAdapt: true,
        builder: (context, child) {
          return AppThemeBuilder(builder: (context) {
            final themeController = Get.put(ThemeController());
            themeController.setInitialDarkMode();
            final isDark = themeController.isDarkTheme.value;
            return MaterialApp(
                title: 'Roqqu Assesment',
                theme: AppTheme(isDark: isDark).theme,
                debugShowCheckedModeBanner: false,
                home: const HomePage());
          });
        }
    );
  }
}
