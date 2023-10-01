import 'package:life_shared/src/core/constant/duration_constant.dart';

final class DateTimeConstants {
  DateTimeConstants._();

  static DateTime dateTimeNow = DateTime.now();
  static DateTime dateTimeTomorrow = DateTime.now().subtract(
    DurationConstant.durationDayMinusOne,
  );

  static DateTime dateTimeYesterday = DateTime.now().subtract(
    DurationConstant.durationDayPlusOne,
  );

  static DateTime selectableLastYear = DateTime(dateTimeNow.year + 3);

  static String ddMMMyyyHHmm = 'dd MMM yyyy HH:mm';
}
