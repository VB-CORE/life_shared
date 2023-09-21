import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

mixin CustomLogger {
  static void log(dynamic message) {
    if (!kDebugMode) return;
    Logger().e(message);
  }
}
