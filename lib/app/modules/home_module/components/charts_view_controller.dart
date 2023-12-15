import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:k_chart/flutter_k_chart.dart';

import '../../../../core/utils/logger.dart';
import '../../../data/models/candle_stick_model/candle_stick_model.dart';
import 'package:k_chart/flutter_k_chart.dart' as k;


class ChartsViewController extends GetxController {
  final isFirstTime = true.obs;
  final data = <KLineEntity>[].obs;
  final isLoading = false.obs;
  final isLineChart = false.obs;
  // final data = <Candle>[].obs;
  // final data = <CandleData>[].obs;
  List<String> times = [
    '1s',
    '1m',
    '1h',
    '2h',
    '4h',
    '1d',
    '1w',
    '1M',
  ];
  final selectedTimeLine = '1m'.obs;

  changeTime(String time) async {
    data.clear();
    isFirstTime(true);
    isLoading(true);
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading(false);
    selectedTimeLine.value = time;
  }


  addCandleData(AsyncSnapshot snapshot) async {
     final snap =
                      CandleStickModel.fromJson(jsonDecode(snapshot.data));
                  final snapData = snap.k ?? const KModel();

                  final candleData = k.KLineEntity.fromCustom(
                    time: (snapData.t ?? 0),
                    open: double.tryParse(snapData.o ?? "") ?? 0.0,
                    close: double.tryParse(snapData.c ?? "") ?? 0.0,
                    vol: double.tryParse(snapData.v ?? "") ?? 0.0,
                    high: double.tryParse(snapData.h ?? "") ?? 0.0,
                    low: double.tryParse(snapData.l ?? "") ?? 0.0,
                  );
                  // final candleData = Candle(
                  //   date: DateTime.fromMillisecondsSinceEpoch(snapData.t ?? 0),
                  //   open: double.tryParse(snapData.o ?? "") ?? 0.0,
                  //   close: double.tryParse(snapData.c ?? "") ?? 0.0,
                  //   volume: double.tryParse(snapData.v ?? "") ?? 0.0,
                  //   high: double.tryParse(snapData.h ?? "") ?? 0.0,
                  //   low: double.tryParse(snapData.l ?? "") ?? 0.0,
                  // );
                  // final candleData = CandleData(
                  //   timestamp: snapData.t ?? 0,
                  //   open: double.tryParse(snapData.o ?? "") ?? 0.0,
                  //   close: double.tryParse(snapData.c ?? "") ?? 0.0,
                  //   volume: double.tryParse(snapData.v ?? "") ?? 0.0,
                  //   high: double.tryParse(snapData.h ?? "") ?? 0.0,
                  //   low: double.tryParse(snapData.l ?? "") ?? 0.0,
                  // );
                  if (isFirstTime.value) {
                    for (var i = 0; i < 10; i++) {
                      data.add(k.KLineEntity.fromCustom(
                        time: (snapData.t ?? 0),
                        open: double.tryParse(snapData.o ?? "") ?? 0.0,
                        close: double.tryParse(snapData.o ?? "") ?? 0.0,
                        // close: double.tryParse(snapData.c ?? "") ?? 0.0,
                        vol: double.tryParse(snapData.v ?? "") ?? 0.0,
                        high: double.tryParse(snapData.o ?? "") ?? 0.0,
                        low: double.tryParse(snapData.o ?? "") ?? 0.0,
                      ));
                    }
                    // data.add(candleData);
                    // data.add(candleData);
                    // data.add(candleData);
                    isFirstTime.value = false;
                  }
                  if (!snapData.x) {
                    final prevCandle = data.last;
                    data.remove(prevCandle);
                    data.add(candleData);
                    // logger(data, 'The data', 10000);
                  }
                  if (snapData.x) {
                    // final candleData =
                    //     CandleData(timestamp: 0, open: 0.0, close: 0.0, volume: 0.0);
                    data.add(candleData);
                    // logger(data, 'The data', 10000);
                  }
  }
}
