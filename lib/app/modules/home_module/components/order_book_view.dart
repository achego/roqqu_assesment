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
import 'package:roqqu_assesment/core/utils/app_images.dart';
import 'package:roqqu_assesment/core/utils/app_styles.dart';

import '../../../../core/theme/app_colors.dart';

class OrderBookView extends StatelessWidget {
  const OrderBookView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderBookController());
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
            if (!snapshot.hasData) {
              return const SizedBox(
                height: 50,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (snapshot.hasData) {
              final orderItem =
                  OrderBookModel.fromJson(jsonDecode(snapshot.data));
              if (orderItem.m) {
                controller.buyersOrders.add(orderItem);
              } else {
                controller.sellersOrders.add(orderItem);
              }
              return Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: fittedSize(
                              15,
                              17,
                              child: SvgPicture.asset(AppIconSvgs.menu2),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: fittedSize(
                              15,
                              17,
                              child: SvgPicture.asset(AppIconSvgs.menu2),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
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
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        alignment: Alignment.center,
                        height: 32.h,
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Row(children: [
                          Text(
                            '10',
                            style: TextStyles.text(fontSizeDiff: -2),
                          ),
                          spacew(10),
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
                              shrinkWrap: true,
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
                                '${(orderItem.p ?? "")}',
                                style: TextStyles.text(
                                    fontSizeDiff: 2,
                                    color: orderItem.m
                                        ? AppColors.green
                                        : Colors.red),
                              ),
                              spacew(8),
                              square(16,
                                  child: SvgPicture.asset(
                                    AppIconSvgs.arrowUp,
                                    color: orderItem.m
                                        ? AppColors.green
                                        : Colors.red,
                                  )),
                              spacew(8),
                              Text(
                                '36,641.20',
                                style: TextStyles.text(fontSizeDiff: 2),
                              )
                            ],
                          ),
                          spaceh(20),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    _buildOrderItem('36920.12',
                                        isStart: true, color: Colors.red),
                                    _buildOrderItem('Amounts'),
                                    _buildOrderItem('Total', isEnd: true),
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
                fontSizeDiff: -2, color: color ?? AppColors.textDark),
            textAlign: isEnd
                ? TextAlign.end
                : (isStart ? TextAlign.start : TextAlign.center),
          ),
        ),
      );


}
