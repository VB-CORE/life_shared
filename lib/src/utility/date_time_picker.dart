import 'package:flutter/material.dart';
import 'package:life_shared/src/core/constant/date_time_constant.dart';
import 'package:life_shared/src/models/date_time_model.dart';
import 'package:life_shared/src/utility/date_time_formatter.dart';

class DateTimePicker {
  DateTimePicker._();

  static Future<DateTimeModel?> selectedDateTime(BuildContext context) async {
    final selectedDate = await _selectDate(context);
    if (selectedDate == null || !context.mounted) return null;
    final selectedTime = await selectTime(context);
    if (selectedTime == null || !context.mounted) return null;

    final selectedDateAndTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );
    final formattedText = DateTimeFormatter.formatValueDetail(
      selectedDateAndTime,
    );

    return DateTimeModel(
      formattedText: formattedText,
      dateTime: selectedDateAndTime,
    );
  }

  static Future<DateTimeModel?> selectedOnlyTime(BuildContext context) async {
    final selected = await selectTime(context);
    if (selected == null || !context.mounted) return null;
    final time = DateTime.now().copyWith(
      hour: selected.hour,
      minute: selected.minute,
    );
    final formattedText = DateTimeFormatter.formatValueDetailOnlyHour(time);
    return DateTimeModel(
      formattedText: formattedText,
      dateTime: time,
    );
  }

  static Future<DateTime?> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTimeConstants.dateTimeTomorrow,
      firstDate: DateTimeConstants.dateTimeTomorrow,
      lastDate: DateTimeConstants.selectableLastYear,
    );
    return pickedDate;
  }

  static Future<TimeOfDay?> selectTime(BuildContext context) async {
    final initialTimeOfDay = TimeOfDay.now();
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTimeOfDay,
      initialEntryMode: TimePickerEntryMode.dialOnly,
    );
    return pickedTime;
  }
}
