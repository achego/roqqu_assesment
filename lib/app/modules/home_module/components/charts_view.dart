import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:roqqu_assesment/app/data/models/candle_stick_model/candle_stick_model.dart';
import 'package:roqqu_assesment/app/data/providers/stream_provider.dart';
import 'package:roqqu_assesment/app/modules/home_module/components/charts_view_controller.dart';
import 'package:roqqu_assesment/app/modules/home_module/components/mock_data.dart';
import 'package:roqqu_assesment/app/modules/home_module/home_controller.dart';
import 'package:roqqu_assesment/core/theme/app_colors.dart';
import 'package:roqqu_assesment/core/utils/logger.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import 'package:interactive_chart/interactive_chart.dart';

import '../../../components/functions/global/globals.dart';

class ChartsView extends StatelessWidget {
  const ChartsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<CandleData> _data = MockDataTesla.candles;
    final controller = Get.put(ChartsViewController());
    final homeCotroller = Get.put(HomeController());
    // bool _darkMode = true;
    // bool _showAverage = false;
    return SizedBox(
      height: 700.h,
      child: Column(
        children: [
          Container(
            height: 40.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Time',
                  style: TextStyles.text(
                      fontSizeDiff: 1, color: AppColors.textLight),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.times.length,
                    itemBuilder: (context, index) {
                      final time = controller.times[index];
                      return InkWell(
                        onTap: () {
                          controller.selectedTimeLine.value = time;
                        },
                        child: Obx(
                          () {
                            final isActive =
                                controller.selectedTimeLine.value == time;

                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                  color: isActive
                                      ? AppColors.textLight.withOpacity(0.4)
                                      : null,
                                  borderRadius: BorderRadius.circular(100)),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                      );
                    },
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
              child: square(20, child: SvgPicture.asset(AppIconSvgs.expand)),
            ),
          ),
          const Divider(),
          Expanded(
            child: StreamBuilder(
              stream: StreamProvider.getCandleLineStream().stream,
              builder: (context, snapshot) {
                // logger(snapshot);
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'An Error occured getting stream',
                      style: TextStyles.text(),
                    ),
                  );
                }
                // logger(snapshot, 'SnapShot', 3000);
                if (!snapshot.hasData) {
                  return const SizedBox(
                    height: 50,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (snapshot.hasData) {
                  // logger(snapshot.data, 'The Snapshot data');
                  // logger(snapshot.data.runtimeType, 'The Snapshot data');

                  final snap =
                      CandleStickModel.fromJson(jsonDecode(snapshot.data));
                  final snapData = snap.k ?? const KModel();
                  // homeCotroller.currentPrice.value = snapData.c ?? '';

                  final candleData = CandleData(
                    timestamp: snapData.t ?? 0,
                    open: double.tryParse(snapData.o ?? "") ?? 0.0,
                    close: double.tryParse(snapData.c ?? "") ?? 0.0,
                    volume: double.tryParse(snapData.v ?? "") ?? 0.0,
                    high: double.tryParse(snapData.h ?? "") ?? 0.0,
                    low: double.tryParse(snapData.l ?? "") ?? 0.0,
                  );
                  if (controller.isFirstTime.value) {
                    controller.data.add(candleData);
                    controller.data.add(candleData);
                    controller.data.add(candleData);
                    controller.isFirstTime.value = false;
                  }
                  if (!snapData.x) {
                    final prevCandle = controller.data.last;
                    controller.data.remove(prevCandle);
                    controller.data.add(candleData);
                    logger(controller.data, 'The data', 10000);
                  }
                  if (snapData.x) {
                    // final candleData =
                    //     CandleData(timestamp: 0, open: 0.0, close: 0.0, volume: 0.0);
                    controller.data.add(candleData);
                    logger(controller.data, 'The data', 10000);
                  }
                }
                return Obx(
                  () {
                    // logger('here', '===============================');
                    return controller.data.length < 3
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: InteractiveChart(
                              // initialVisibleCandleCount: 0,
                          
                              candles: controller.data,
                              /** Example styling */
                              style: ChartStyle(
                          
                                // priceGainColor: Colors.teal[200]!,
                                // priceLossColor: Colors.blueGrey,
                                // volumeColor: Colors.teal.withOpacity(0.8),
                                // trendLineStyles: [
                                //   Paint()
                                //     ..strokeWidth = 2.0
                                //     ..strokeCap = StrokeCap.round
                                //     ..color = Colors.deepOrange,
                                //   Paint()
                                //     ..strokeWidth = 4.0
                                //     ..strokeCap = StrokeCap.round
                                //     ..color = Colors.orange,
                                // ],
                                // priceGridLineColor: Colors.blue[200]!,
                                // priceLabelStyle: TextStyle(color: Colors.blue[200]),
                                // timeLabelStyle: TextStyle(color: Colors.blue[200]),
                                selectionHighlightColor:
                                    Colors.red.withOpacity(0.2),
                                overlayBackgroundColor:
                                    Colors.red[900]!.withOpacity(0.6),
                                overlayTextStyle:
                                    TextStyle(color: Colors.red[100]),
                                timeLabelHeight: 32,
                                volumeHeightFactor:
                                    0.2, // volume area is 20% of total height
                              ),
                              /** Customize axis labels */
                              timeLabel: (timestamp, visibleDataCount) =>
                                  "${timestamp.round()}",
                              priceLabel: (price) => "${price.round()}",

                              /** Customize overlay (tap and hold to see it)
                                         ** Or return an empty object to disable overlay info. */
                              overlayInfo: (candle) => {
                                "💎": "🤚    ",
                                "Hi": "${candle.high?.toStringAsFixed(2)}",
                                "Lo": "${candle.low?.toStringAsFixed(2)}",
                              },
                              /** Callbacks */
                              onTap: (candle) =>
                                  logger("user tapped on $candle"),
                              onCandleResize: (width) =>
                                  logger("each candle is $width wide"),
                            ),
                          );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
// class ChartsView extends StatelessWidget {
//   const ChartsView({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final datas = [
//       KLineEntity.fromCustom(
//           open: 10, close: 20, time: 4, high: 10, low: 3, vol: 3),
//       KLineEntity.fromCustom(
//           open: 20, close: 15, time: 20, high: 0, low: 0, vol: 6),
//       KLineEntity.fromCustom(
//           open: 10, close: 20, time: 4, high: 10, low: 3, vol: 3),
//     ];
//     final chartStyle = ChartStyle();
//     final chartColors = ChartColors()..bgColor = [AppColors.white, Colors.red];
//     return StreamBuilder(
//       stream: StreamProvider.getCandleLineStream().stream,
//       builder: (context, snapshot) {
//         // logger(snapshot);
//         if (snapshot.hasError) {
//           return Center(
//             child: Text(
//               'An Error occured getting stream',
//               style: TextStyles.text(),
//             ),
//           );
//         }
//         // logger(snapshot, 'SnapShot', 3000);
//         if (!snapshot.hasData) {
//           return const SizedBox(
//             height: 90,
//             child: Center(child: CircularProgressIndicator()),
//           );
//         }
//         return KChartWidget(
//             datas, // Required，Data must be an ordered list，(history=>now)
//             chartStyle,
//             chartColors,
//             isLine: false, // Decide whether it is k-line or time-sharing
//             // mainState: _mainState,// Decide what the main view shows
//             // secondaryState: _secondaryState,// Decide what the sub view shows
//             fixedLength: 3, // Displayed decimal precision
//             timeFormat: TimeFormat.YEAR_MONTH_DAY,
//             onLoadMore: (bool
//                 a) {}, // Called when the data scrolls to the end. When a is true, it means the user is pulled to the end of the right side of the data. When a
//             // is false, it means the user is pulled to the end of the left side of the data.
//             maDayList: [
//               5,
//               10,
//               20
//             ], // Display of MA,This parameter must be equal to DataUtil.calculate‘s maDayList
//             translations: kChartTranslations, // Graphic language
//             volHidden: false, // hide volume
//             showNowPrice: true, // show now price
//             isOnDrag:
//                 (isDrag) {}, // true is on Drag.Don't load data while Draging.
//             onSecondaryTap: () {}, // on secondary rect taped.
//             isTrendLine:
//                 false, // You can use Trendline by long-pressing and moving your finger after setting true to isTrendLine property.
//             xFrontPadding: 100 // padding in front
//             );
//       },
//     );
//   }
// }
