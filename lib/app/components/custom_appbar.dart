import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:roqqu_assesment/core/theme/theme_controller.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/app_images.dart';
import 'functions/global/globals.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Get.find<ThemeController>().isDarkTheme.value;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.w),
      color: AppColors().whiteR,
      child: Row(
        children: [
          Row(
            children: [
              fittedSize(34, 20,
                  child: SvgPicture.asset(
                    AppIconSvgs.logo,
                    color: isDark ? AppColors.white : null,
                  )),
              spacew(10),
              fittedSize(20, 90,
                  child: SvgPicture.asset(AppIconSvgs.brandName,
                      color: isDark ? AppColors.white : null))
            ],
          ),
          spacew(10),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 32.w,
                width: 32.w,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.background),
                child: Image.asset(AppImages.profile),
              ),
              spacew(16),
              square(24, child: SvgPicture.asset(AppIconSvgs.globe)),
              spacew(16),
              square(24, child: SvgPicture.asset(AppIconSvgs.menu)),
            ],
          ))
        ],
      ),
    );
  }
}
