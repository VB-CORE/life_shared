import 'package:flutter/material.dart';

@immutable
final class DateTimeModel {
  const DateTimeModel({
    required this.formattedText,
    required this.dateTime,
  });

  final String formattedText;
  final DateTime dateTime;
}
