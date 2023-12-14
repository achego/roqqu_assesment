import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class FontFamily {
  static const satoshi = 'Satoshi';
}

class TextStyles {
  ///.
  ///```dart
  ///final double fontSize = 14.sp;
  ///```
  static TextStyle text({
    Color? color,
    double? fontSizeDiff,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    String? fontFamily,
    bool italic = false,
    double? height,
    TextDecoration? decoration,
  }) {
    final double fontSize = 14.sp;
    return TextStyle(
      color: color ?? AppColors.textDark,
      fontSize: fontSizeDiff != null ? fontSize + fontSizeDiff.sp : fontSize,
      fontWeight: fontWeight ?? FontWeight.w500,
      overflow: overflow,
      fontStyle: italic ? FontStyle.italic : null,
      height: height,
      decoration: decoration,
      fontFamily: fontFamily ?? FontFamily.satoshi,
    );
  }


  ///.
  ///```dart
  ///final double fontSize = 25.sp;
  ///```
  static TextStyle heading({
    Color? color,
    double? fontSizeDiff,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    String? fontFamily,
    bool italic = false,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    final double fontSize = 25.sp;

    return TextStyle(
      color: color ?? AppColors.textDark,
      letterSpacing: letterSpacing,
      fontSize: fontSizeDiff != null ? fontSize + fontSizeDiff.sp : fontSize,
      fontWeight: fontWeight ?? FontWeight.w600,
      overflow: overflow,
      fontStyle: italic ? FontStyle.italic : null,
      height: height ?? 1,
      fontFamily: fontFamily ?? FontFamily.satoshi,
    );
  }

  ///.
  ///```dart
  ///final double fontSize = 20.sp;
  ///```
  static TextStyle heading2({
    Color? color,
    double? fontSizeDiff,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    String? fontFamily,
    bool italic = false,
    double? height,
    TextDecoration? decoration,
  }) {
    final double fontSize = 20.sp;

    return TextStyle(
      color: color ?? AppColors.textDark,
      fontSize: fontSizeDiff != null ? fontSize + fontSizeDiff.sp : fontSize,
      fontWeight: fontWeight ?? FontWeight.w900,
      overflow: overflow,
      fontStyle: italic ? FontStyle.italic : null,
      height: height ?? 1,
      fontFamily: fontFamily ?? FontFamily.satoshi,
    );
  }
}
