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
import 'package:roqqu_assesment/core/utils/logger.dart';

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
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
        color: AppColors().whiteR,
        child: Row(
          children: [
            Expanded(child: CustomButton(text: 'Buy')),
            spacew(16),
            Expanded(
                child: CustomButton(
              text: 'Sell',
              color: Colors.red,
            )),
          ],
        ),
      ),
      body: Column(
        children: [
          const CustomAppbar(),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                spaceh(8),
                PaddedContainer(
                  child: StreamBuilder(
                      stream:
                          StreamProvider.getCandleLineStream(intervalTime: '1d')
                              .stream,
                      builder: (context, snapshot) {
                        double balance = 0;
                        double oneDayChange = 0;
                        double oneDayChangePercent = 0;
                        double oneDayHight = 0;
                        double oneDayHightPer = 0;
                        double oneDayLow = 0;
                        double oneDayLowPer = 0;
                        if (snapshot.hasData) {
                          final snap = CandleStickModel.fromJson(
                              jsonDecode(snapshot.data));
                          final snapData = snap.k ?? const KModel();
                          if (controller.isFirst.value) {
                            controller.oneDayMark = snapData;
                            controller.isFirst(false);
                          }

                          oneDayChange = (double.tryParse(snapData.c ?? '') ??
                                  0) -
                              (double.tryParse(controller.oneDayMark.c ?? '') ??
                                  0);
                          oneDayChangePercent = (oneDayChange /
                                  (double.tryParse(
                                          controller.oneDayMark.c ?? '') ??
                                      0)) *
                              100;
                          oneDayHight = (double.tryParse(snapData.h ?? '') ??
                                  0) -
                              (double.tryParse(controller.oneDayMark.h ?? '') ??
                                  0);
                          logger((double.tryParse(snapData.h ?? '') ?? 0),
                              'from fata');
                          logger(
                              (double.tryParse(controller.oneDayMark.h ?? '') ??
                                  0),
                              'from me');
                          oneDayHightPer = (oneDayHight /
                                  (double.tryParse(
                                          controller.oneDayMark.h ?? '') ??
                                      0)) *
                              100;
                          oneDayLow = (double.tryParse(snapData.l ?? '') ?? 0) -
                              (double.tryParse(controller.oneDayMark.l ?? '') ??
                                  0);
                          oneDayLowPer = (oneDayLow /
                                  (double.tryParse(
                                          controller.oneDayMark.l ?? '') ??
                                      0)) *
                              100;
                          balance = double.tryParse(snapData.c ?? '') ?? 0;
                        }
                        return Padding(
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
                                            child: SvgPicture.asset(
                                                AppIconSvgs.btc)),
                                        Positioned(
                                          left: 15,
                                          child: square(24,
                                              child: SvgPicture.asset(
                                                  AppIconSvgs.usdt)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'BTC/USDT',
                                    style: TextStyles.text(fontSizeDiff: 4),
                                  ),
                                  spacew(16),
                                  fittedSize(10, 10,
                                      child: SvgPicture.asset(
                                          AppIconSvgs.carratDown)),
                                  spacew(14),
                                  Expanded(
                                      child: SizedBox(
                                    child: Text(
                                      '\$${balance.formatMoney}',
                                      style: TextStyles.text(
                                          fontSizeDiff: 4,
                                          color: AppColors.green),
                                        
                                    ),
                                  ))
                                ],
                              ),
                              spaceh(14),
                              Row(
                                children: [
                                  _buildPriceItem(
                                      iconPath: AppIconSvgs.clock,
                                      text: '24h change',
                                      value:
                                          '${oneDayChange.abs().formatMoney} ${oneDayChangePercent.toStringAsFixed(2)}%',
                                      valueColor: AppColors.green),
                                  _buildVerticalDivider(),
                                  _buildPriceItem(
                                    iconPath: AppIconSvgs.arrowUp,
                                    text: '24h high',
                                    value:
                                        '${oneDayHight.abs().formatMoney} ${oneDayHightPer.toStringAsFixed(2)}%',
                                  ),
                                  _buildVerticalDivider(),
                                  _buildPriceItem(
                                    iconPath: AppIconSvgs.arrowDown,
                                    text: '24h low',
                                    value:
                                        '${oneDayLow.abs().formatMoney} ${oneDayLowPer.toStringAsFixed(2)}%',
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ),
                spaceh(8),
                DefaultTabController(
                    length: 3,
                    child: Container(
                      color: AppColors().whiteR,
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
                                    color: AppColors().backgroundR,
                                  ),
                                  child: TabBar(
                                      unselectedLabelColor: AppColors.textLight,
                                      labelColor: AppColors().textDarkR,
                                      // labelPadding: EdgeInsets.symmetric(
                                      //     vertical: 15.w, horizontal: 10),
                                      labelStyle: TextStyles.text(),
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      automaticIndicatorColorAdjustment: true,
                                      indicator: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        color: AppColors().whiteR,
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
                              height: 600.h,
                              child: TabBarView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    const ChartsView(),
                                    const OrderBookView(),
                                    Container()
                                  ]))
                        ],
                      ),
                    )),
                spaceh(8),
                DefaultTabController(
                    length: 3,
                    child: Container(
                      color: AppColors().whiteR,
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
                                    color: AppColors().backgroundR,
                                  ),
                                  child: TabBar(
                                      unselectedLabelColor: AppColors.textLight,
                                      labelColor: AppColors().textDarkR,
                                      // labelPadding: EdgeInsets.symmetric(
                                      //     vertical: 15.w, horizontal: 10),
                                      labelStyle: TextStyles.text(),
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      automaticIndicatorColorAdjustment: true,
                                      indicator: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        color: AppColors().whiteR,
                                      ),
                                      tabs: const [
                                        Tab(text: 'Open Orders'),
                                        Tab(text: 'Positions '),
                                        Tab(text: 'Recent trades'),
                                      ]),
                                ),
                                // spaceh(3),
                                spaceh(20),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: 300.h,
                              child: TabBarView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40.w),
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'No Open Orders',
                                            style: TextStyles.text(
                                                fontSizeDiff: 4,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                          spaceh(7),
                                          Text(
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id pulvinar nullam sit imperdiet pulvinar',
                                            style: TextStyles.text(),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(),
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
        color: AppColors.textLight.withOpacity(0.1),
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

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.color,
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color ?? AppColors.green,
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: Text(
        text,
        style: TextStyles.text(
            fontSizeDiff: 2,
            fontWeight: FontWeight.bold,
            color: AppColors.white),
      ),
    );
  }
}
