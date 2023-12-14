import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:roqqu_assesment/app/components/functions/global/globals.dart';
import 'package:roqqu_assesment/app/modules/home_module/home_controller.dart';
import 'package:roqqu_assesment/core/theme/app_colors.dart';
import 'package:roqqu_assesment/core/utils/app_images.dart';
import 'package:roqqu_assesment/core/utils/app_styles.dart';

import '../../components/custom_appbar.dart';
import '../../components/padded_container.dart';
import 'components/charts_view.dart';
import 'components/order_book_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0, backgroundColor: AppColors.white),
      body: Column(
        children: [
          const CustomAppbar(),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                spaceh(8),
                PaddedContainer(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'BTC/USDT',
                              style: TextStyles.text(fontSizeDiff: 4),
                            ),
                            spacew(16),
                            fittedSize(14, 17,
                                child:
                                    SvgPicture.asset(AppIconSvgs.carratDown)),
                            spacew(16),
                            Expanded(
                                child: Text(
                              '\$20,634',
                              style: TextStyles.text(
                                  fontSizeDiff: 4, color: AppColors.green),
                            ))
                          ],
                        ),
                        spaceh(14),
                        Row(
                          children: [
                            _buildPriceItem(
                                iconPath: AppIconSvgs.clock,
                                text: '24h change',
                                value: '520.80 +1.25%',
                                valueColor: AppColors.green),
                            _buildVerticalDivider(),
                            _buildPriceItem(
                              iconPath: AppIconSvgs.arrowUp,
                              text: '24h high',
                              value: '520.80 +1.25%',
                            ),
                            _buildVerticalDivider(),
                            _buildPriceItem(
                              iconPath: AppIconSvgs.arrowDown,
                              text: '24h low',
                              value: '520.80 +1.25%',
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                spaceh(8),
                DefaultTabController(
                    length: 3,
                    child: Container(
                      color: AppColors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.h, horizontal: 16.w),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(3.w),
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: AppColors.lightCard,
                                  ),
                                  child: TabBar(
                                      unselectedLabelColor: AppColors.textLight,
                                      labelColor: AppColors.textDark,
                                      // labelPadding: EdgeInsets.symmetric(
                                      //     vertical: 15.w, horizontal: 10),
                                      labelStyle: TextStyles.text(),
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      automaticIndicatorColorAdjustment: true,
                                      indicator: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        color: AppColors.white,
                                      ),
                                      tabs: const [
                                        Tab(text: 'Charts'),
                                        Tab(text: 'Orderbook '),
                                        Tab(text: 'Recent trades'),
                                      ]),
                                ),
                                spaceh(3),
                                spaceh(20),
                                SizedBox(
                                  height: 40.h,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Time',
                                        style: TextStyles.text(
                                            fontSizeDiff: 1,
                                            color: AppColors.textLight),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller.times.length,
                                          itemBuilder: (context, index) {
                                            final time =
                                                controller.times[index];
                                            final isActive = time == '1d';
                                            return Container(
                                              // color: Colors.green,
                                              decoration: BoxDecoration(
                                                  color: isActive
                                                      ? AppColors.textLight
                                                          .withOpacity(0.4)
                                                      : null,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16.w),
                                              child: Text(
                                                time.capitalize ?? "",
                                                style: TextStyles.text(
                                                    fontSizeDiff: 1,
                                                    color: isActive
                                                        ? AppColors.textDark
                                                        : AppColors.textLight),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          spaceh(18),
                          const Divider(),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.all(16.w),
                              child: square(20,
                                  child: SvgPicture.asset(AppIconSvgs.expand)),
                            ),
                          ),
                          const Divider(),
                          SizedBox(
                              height: 500.h,
                              child: TabBarView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    ChartsView(),
                                    OrderBookView(),
                                    Container()
                                  ]))
                        ],
                      ),
                    ))
              ],
            ),
          ))
        ],
      ),
    );
  }

  Container _buildVerticalDivider() => Container(
        height: 48.h,
        width: 1,
        color: AppColors.secondaryDark,
      );

  Expanded _buildPriceItem({
    required String iconPath,
    required String text,
    required String value,
    Color? valueColor,
  }) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              square(16, child: SvgPicture.asset(iconPath)),
              spacew(4),
              Text(text,
                  style: TextStyles.text(
                    fontSizeDiff: -2,
                    color: AppColors.secondaryDark,
                  ))
            ],
          ),
          spaceh(4),
          Text(
            value,
            style: TextStyles.text(color: valueColor),
          )
        ],
      ),
    ));
  }
}
