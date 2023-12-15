import 'package:get/get.dart';
import 'package:roqqu_assesment/app/modules/home_module/components/charts_view_controller.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../core/utils/logger.dart';
import '../../../core/values/app_string.dart';

class StreamProvider {
  static WebSocketChannel getCandleLineStream(
      {String? intervalTime, String? symbol}) {

        final time = Get.put(ChartsViewController()).selectedTimeLine.value;
        logger(time, 'The Time');
        logger(intervalTime, 'The Time');
    final kline =
        '${AppString.binanceWssBase}/ws/${symbol ?? 'btcusdt'}@kline_${intervalTime ?? '$time'}';
    logger('Connecting to', kline);
    WebSocketChannel channel = WebSocketChannel.connect(Uri.parse(kline));
    return channel;
  }
  static WebSocketChannel getOrderBooks() {
    const orderBook = 'wss://stream.binance.com:9443/ws/btcusdt@trade';
    logger('Connecting to', orderBook);
    WebSocketChannel channel = WebSocketChannel.connect(Uri.parse(orderBook));
    return channel;
  }
}
