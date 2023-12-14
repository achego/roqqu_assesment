import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:roqqu_assesment/app/components/functions/global/globals.dart';
import 'package:roqqu_assesment/app/data/providers/stream_provider.dart';
import 'package:roqqu_assesment/app/modules/home_module/home_controller.dart';
import 'package:roqqu_assesment/core/theme/app_colors.dart';
import 'package:roqqu_assesment/core/utils/app_extensions.dart';
import 'package:roqqu_assesment/core/utils/app_images.dart';
import 'package:roqqu_assesment/core/utils/app_styles.dart';

import '../../components/custom_appbar.dart';
import '../../components/padded_container.dart';
import '../../data/models/candle_stick_model/candle_stick_model.dart';
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
                            SizedBox(
                              width: 22 * 2,
                              child: Stack(
                                children: [
                                  square(24,
                                      child: SvgPicture.asset(AppIconSvgs.btc)),
                                  Positioned(
                                    left: 15,
                                    child: square(24,
                                        child:
                                            SvgPicture.asset(AppIconSvgs.usdt)),
                                  ),
                                ],
                              ),
                            ),

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
                                child: SizedBox(
                              child: StreamBuilder(
                                  stream: StreamProvider.getCandleLineStream()
                                      .stream,
                                  builder: (context, snapshot) {
                                    double balance = 0;
                                    if (snapshot.hasData) {
                                      final snap = CandleStickModel.fromJson(
                                          jsonDecode(snapshot.data));
                                      final snapData = snap.k ?? const KModel();
                                      balance =
                                          double.tryParse(snapData.c ?? '') ??
                                              0;
                                    }
                                    return Text(
                                      '\$${balance.formatMoney}',
                                      style: TextStyles.text(
                                          fontSizeDiff: 4,
                                          color: AppColors.green),
                                    );
                                  }),
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
                                // spaceh(3),
                                spaceh(20),
                              
                              ],
                            ),
                          ),
                         
                          SizedBox(
                              height: 700.h,
                              child: TabBarView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    const ChartsView(),
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
