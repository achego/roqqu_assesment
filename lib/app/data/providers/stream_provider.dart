import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../core/utils/logger.dart';
import '../../../core/values/app_string.dart';

class StreamProvider {
  static WebSocketChannel getCandleLineStream(
      {String? intervalTime, String? symbol}) {
    final kline =
        '${AppString.binanceWssBase}/ws/${symbol ?? 'btcusdt'}@kline_${intervalTime ?? '1m'}';
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
