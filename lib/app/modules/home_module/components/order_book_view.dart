import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:roqqu_assesment/app/components/functions/global/globals.dart';
import 'package:roqqu_assesment/app/data/models/order_book_model/order_book_model.dart';
import 'package:roqqu_assesment/app/data/providers/stream_provider.dart';
import 'package:roqqu_assesment/app/modules/home_module/components/order_book_controller.dart';
import 'package:roqqu_assesment/core/utils/app_extensions.dart';
import 'package:roqqu_assesment/core/utils/app_images.dart';
import 'package:roqqu_assesment/core/utils/app_styles.dart';
import 'package:roqqu_assesment/core/utils/logger.dart';

import '../../../../core/theme/app_colors.dart';

class OrderBookView extends StatelessWidget {
  const OrderBookView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderBookController());
    ScrollController bListController = ScrollController();
    ScrollController sListController = ScrollController();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: StreamBuilder(
          stream: StreamProvider.getOrderBooks().stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'An Error occured getting stream',
                  style: TextStyles.text(),
                ),
              );
            }
            // logger(snapshot, 'SnapShot', 3000);
            if (!snapshot.hasData && controller.sellersOrders.isEmpty) {
              return const SizedBox(
                height: 50,
                child: Center(
                    child: CircularProgressIndicator(
                  color: AppColors.green,
                )),
              );
            }
            if (snapshot.hasData || controller.sellersOrders.isNotEmpty) {
              final orderItem =
                  OrderBookModel.fromJson(jsonDecode(snapshot.data??'{}'));
              if (orderItem.m) {
                controller.buyersOrders.add(orderItem);
                try {
                  bListController.animateTo(
                      bListController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                } catch (e) {
                  logger('Not Attached');
                }
              } else {
                controller.sellersOrders.add(orderItem);
try {
                  sListController.animateTo(
                      sListController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                } catch (e) {
                  logger('Not attached');
                }
                
              }
              return Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: AppColors().backgroundR,
                                borderRadius: BorderRadius.circular(4.r)),
                            child: fittedSize(
                              15,
                              17,
                              child: SvgPicture.asset(AppIconSvgs.menu2),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: fittedSize(
                              15,
                              17,
                              child: SvgPicture.asset(AppIconSvgs.menu2),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: fittedSize(
                              15,
                              17,
                              child: SvgPicture.asset(AppIconSvgs.menu2),
                            ),
                          ),
                        ],
                      ),
                      spacew(10),
                      const Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        alignment: Alignment.center,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: AppColors().backgroundR,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Row(children: [
                          Text(
                            '10',
                            style: TextStyles.text(fontSizeDiff: -2),
                          ),
                          spacew(15),
                          square(8,
                              child: SvgPicture.asset(AppIconSvgs.carratDown))
                        ]),
                      )
                    ],
                  ),
                  spaceh(12),
                  Row(
                    children: [
                      _buildTableHeading('Price', '(USDT)', isStart: true),
                      _buildTableHeading('Amounts', '(BTC)'),
                      _buildTableHeading('Total', '', isEnd: true),
                    ],
                  ),
                  spaceh(12),
                  Flexible(
                    child: Obx(
                      () => Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              controller: sListController,

                              // shrinkWrap: true,
                              itemCount: controller.sellersOrders.length,
                              itemBuilder: (context, index) {
                                final orderItemS =
                                    controller.sellersOrders[index];
                                return Row(
                                  children: [
                                    _buildOrderItem(
                                        (double.tryParse(orderItemS.p ?? '')
                                                ?.toStringAsFixed(2) ??
                                            ''),
                                        isStart: true,
                                        color: Colors.red),
                                    _buildOrderItem(
                                        double.tryParse(orderItemS.q ?? '')
                                                ?.toStringAsFixed(5) ??
                                            ''),
                                    _buildOrderItem(
                                        (((double.tryParse(
                                                        orderItemS.q ?? "") ??
                                                    1) *
                                                (double.tryParse(
                                                        orderItemS.p ?? "") ??
                                                    1))
                                            .toStringAsFixed(5)),
                                        isEnd: true),
                                  ],
                                );
                              },
                            ),
                          ),
                          spaceh(20),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                (double.tryParse(orderItem.p ?? '')
                                        ?.formatMoney
                                        .toString() ??
                                    ""),
                                style: TextStyles.text(
                                    fontSizeDiff: 2,
                                    color: orderItem.m
                                        ? AppColors.green
                                        : Colors.red),
                              ),
                              spacew(8),
                              square(16,
                                  child: SvgPicture.asset(
                                    orderItem.m
                                        ? AppIconSvgs.arrowUp
                                        : AppIconSvgs.arrowDown,
                                    color: orderItem.m
                                        ? AppColors.green
                                        : Colors.red,
                                  )),
                              spacew(8),
                              Text(
                                (double.tryParse(orderItem.p ?? '')
                                        ?.formatMoney
                                        .toString() ??
                                    ""),
                                style: TextStyles.text(fontSizeDiff: 2),
                              )
                            ],
                          ),
                          spaceh(20),
                          Expanded(
                            child: ListView.builder(
                              controller: bListController,
                              // shrinkWrap: true,
                              itemCount: controller.buyersOrders.length,
                              itemBuilder: (context, index) {
                                final orderItemB =
                                    controller.buyersOrders[index];
                                return Row(
                                  children: [
                                    _buildOrderItem(
                                        (double.tryParse(orderItemB.p ?? '')
                                                ?.toStringAsFixed(2) ??
                                            ''),
                                        isStart: true,
                                        color: AppColors.green),
                                    _buildOrderItem(
                                        double.tryParse(orderItemB.q ?? '')
                                                ?.toStringAsFixed(5) ??
                                            ''),
                                    _buildOrderItem(
                                        (((double.tryParse(
                                                        orderItemB.q ?? "") ??
                                                    1) *
                                                (double.tryParse(
                                                        orderItemB.p ?? "") ??
                                                    1))
                                            .toStringAsFixed(5)),
                                        isEnd: true),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
            return const SizedBox(
              height: 50,
              child: Center(child: CircularProgressIndicator()),
            );
          }),
    );
  }

  Expanded _buildTableHeading(String title, String subTitle,
          {bool isStart = false, bool isEnd = false}) =>
      Expanded(
          child: Column(
        crossAxisAlignment: isEnd
            ? CrossAxisAlignment.end
            : (isStart ? CrossAxisAlignment.start : CrossAxisAlignment.center),
        children: [
          Text(
            title,
            style:
                TextStyles.text(fontSizeDiff: -2, color: AppColors.textLight),
          ),
          spaceh(4),
          Text(
            subTitle,
            style:
                TextStyles.text(fontSizeDiff: -2, color: AppColors.textLight),
          ),
        ],
      ));
  Expanded _buildOrderItem(String value,
          {bool isStart = false, bool isEnd = false, Color? color}) =>
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 7.h),
          child: Text(
            value,
            style: TextStyles.text(
                fontSizeDiff: -2, color: color ?? AppColors().textDarkR),
            textAlign: isEnd
                ? TextAlign.end
                : (isStart ? TextAlign.start : TextAlign.center),
          ),
        ),
      );


}
