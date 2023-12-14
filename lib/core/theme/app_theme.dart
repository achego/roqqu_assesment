import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_styles.dart';
import 'app_colors.dart';

class AppTheme {
  final bool isDark;
  AppTheme({required this.isDark});

  ThemeData get theme {
    // return _darkTheme;
    return isDark ? _darkTheme : _lightTheme;
  }

  ThemeData get _lightTheme => ThemeData(
        fontFamily: FontFamily.satoshi,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            // backgroundColor: AppColors.background,
            ),
        // fontFamily: FontFamily.nunito,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
            // iconTheme: IconThemeData(color: AppColors.darkText),
            actionsIconTheme: IconThemeData(color: AppColors.primary),
            // titleTextStyle:
            //     TextStyles.heading(color: AppColors.darkText, fontSizeDiff: -5),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              // systemNavigationBarColor: AppColors.statusBar,
              statusBarIconBrightness: Brightness.dark,
            )),
        brightness: Brightness.light,
      );

  ///Dark theme
  ThemeData get _darkTheme => _lightTheme.copyWith(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColorsDark.background),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColorsDark.background,
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColorsDark.background,
          systemNavigationBarColor: AppColorsDark.background,
          statusBarIconBrightness: Brightness.light,
        )),
      );
}
