import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '../utils/logger.dart';
import 'theme_controller.dart';

class AppThemeBuilder extends StatefulWidget {
  final Function(BuildContext) builder;

  const AppThemeBuilder({super.key, required this.builder});

  @override
  AppThemeBuilderState createState() => AppThemeBuilderState();

  static AppThemeBuilderState of(BuildContext context) {
    return context.findAncestorStateOfType<AppThemeBuilderState>()
        as AppThemeBuilderState;
  }
}

class AppThemeBuilderState extends State<AppThemeBuilder> {
  final themeController = Get.put(ThemeController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _handleBrightnessChange();
    SchedulerBinding.instance.window.onPlatformBrightnessChanged =
        _handleBrightnessChange;
  }

  void _handleBrightnessChange() {
    logger('Brifhness Has Chabed');
    // setState(() {
    // Update the current brightness when the system theme changes
    themeController.isDarkTheme.value =
        SchedulerBinding.instance.window.platformBrightness == Brightness.dark;
    // });
    rebuild();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  void rebuild() {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    setState(() {});
    (context as Element).visitChildren(rebuild);
  }
}
