import 'dart:developer';
import 'package:flutter/foundation.dart';

logger(dynamic text, [title, maxChars = 200]) {
  // print('IS DEbug mode ${kDebugMode.toString()}');
  // const maxChars = 200;
  if (kDebugMode) {
    String trace = StackTrace.current.toString().split('\n')[1];
    if (trace.contains('>')) {
      if (trace.split('>').length >= 2) {
        trace = trace.split('>')[1];
      }
    }
    if (title != null) {
      log('\x1B[35m${DateTime.now().hour}:${DateTime.now().second}\x1B[0m - \x1B[31m$title\x1B[0m === ${text.toString().length > maxChars ? text.toString().substring(0, maxChars) : text.toString()} $trace');
    } else {
      log('${text.toString().length > maxChars ? text.toString().substring(0, maxChars) : text.toString()} $trace');
    }
  }
}
