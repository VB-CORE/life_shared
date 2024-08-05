import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@immutable
final class DateTimeFormatter {
  const DateTimeFormatter._();
  static String formatValue(DateTime value) {
    final formattedValue = DateFormat('yyyy-MM-dd').format(value);
    return formattedValue;
  }

  static String formatValueDetail(DateTime value) {
    // 31 May 2013 06:00 to date format dd MMM yyyy
    final formattedValue = DateFormat('dd MMM yyyy HH:mm').format(value);
    return formattedValue;
  }

  static String formatValueDetailOnlyHour(DateTime value) {
    // 31 May 2013 06:00 to date format dd MMM yyyy
    final formattedValue = DateFormat('HH:mm').format(value);
    return formattedValue;
  }
}

extension TimeOfDayExtension on TimeOfDay {
  bool isBefore(TimeOfDay other) {
    final minutes = hour * TimeOfDay.minutesPerHour + minute;
    final otherMinutes = other.hour * TimeOfDay.minutesPerHour + other.minute;
    return minutes < otherMinutes;
  }

  bool isAfter(TimeOfDay other) {
    final minutes = hour * TimeOfDay.minutesPerHour + minute;
    final otherMinutes = other.hour * TimeOfDay.minutesPerHour + other.minute;
    return minutes > otherMinutes;
  }
}
