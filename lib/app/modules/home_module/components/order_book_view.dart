import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqqu_assesment/app/components/functions/global/globals.dart';
import 'package:roqqu_assesment/core/utils/app_images.dart';

import '../../../../core/theme/app_colors.dart';

class OrderBookView extends StatelessWidget {
  const OrderBookView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: fittedSize(
                      10,
                      12,
                      child: SvgPicture.asset(AppIconSvgs.menu2),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: fittedSize(
                      10,
                      12,
                      child: SvgPicture.asset(AppIconSvgs.menu2),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: fittedSize(
                      10,
                      12,
                      child: SvgPicture.asset(AppIconSvgs.menu2),
                    ),
                  ),
                ],
              ),
              spacew(10),
              Spacer(),
              Container(
                alignment: Alignment.center,
                height: 32.h,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
