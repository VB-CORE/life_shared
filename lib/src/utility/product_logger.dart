import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

mixin ProductLogger {
  static void log(dynamic message) {
    if (!kDebugMode) return;
    Logger().e(message);
  }
}
