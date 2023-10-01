import 'package:flutter/material.dart';
import 'package:life_shared/src/core/constant/date_time_constant.dart';
import 'package:life_shared/src/models/date_time_model.dart';
import 'package:life_shared/src/utility/date_time_formatter.dart';

class DateTimePicker {
  DateTimePicker._();

  static Future<DateTimeModel?> selectedDateTime(BuildContext context) async {
    final selectDate = await _selectDate(context);
    if (!context.mounted) return null;
    final selectTime = await _selectTime(context);

    final selectedDateAndTime = DateTime(
      selectDate.year,
      selectDate.month,
      selectDate.day,
      selectTime.hour,
      selectTime.minute,
    );
    final formattedText = DateTimeFormatter.formatValueDetail(
      selectedDateAndTime,
    );

    return DateTimeModel(
      formattedText: formattedText,
      dateTime: selectedDateAndTime,
    );
  }

  static Future<DateTime> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTimeConstants.dateTimeTomorrow,
      firstDate: DateTimeConstants.dateTimeTomorrow,
      lastDate: DateTimeConstants.selectableLastYear,
    );
    if (pickedDate == null) return DateTimeConstants.dateTimeTomorrow;
    return pickedDate;
  }

  static Future<TimeOfDay> _selectTime(BuildContext context) async {
    final initialTimeOfDay = TimeOfDay.now();
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTimeOfDay,
      initialEntryMode: TimePickerEntryMode.dialOnly,
    );
    if (pickedTime == null) return TimeOfDay.now();
    return pickedTime;
  }
}
