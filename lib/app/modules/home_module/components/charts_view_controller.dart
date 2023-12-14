import 'package:get/get.dart';
import 'package:interactive_chart/interactive_chart.dart';

class ChartsViewController extends GetxController {
  final isFirstTime = true.obs;
  final data = <CandleData>[].obs;
  List<String> times = [
    '1h',
    '2h',
    '4h',
    '1d',
    '1w',
    '1M',
  ];
  final selectedTimeLine = '1d'.obs;
}
