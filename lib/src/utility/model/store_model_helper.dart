import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:life_shared/life_shared.dart';

final class StoreModelHelper {
  StoreModelHelper({required this.model});

  final StoreModel model;

  /// Check is store open or not
  /// If store open return true
  /// If store close return false
  ///
  /// If store open time and close time is null return null
  bool? get isStoreOpen {
    final openTime = model.openTime;
    final closeTime = model.closeTime;
    if (openTime.ext.isNullOrEmpty) return null;
    if (closeTime.ext.isNullOrEmpty) return null;
    if (!closeTime!.contains(':')) return null;
    if (!openTime!.contains(':')) return null;

    final slittedOpenTime = openTime.split(':');
    final slittedCloseTime = closeTime.split(':');

    if (slittedOpenTime.length != 2) return null;
    if (slittedCloseTime.length != 2) return null;

    final openTimeOfDay = TimeOfDay(
      hour: int.parse(slittedOpenTime[0]),
      minute: int.parse(slittedOpenTime[1]),
    );

    final closeTimeOfDay = TimeOfDay(
      hour: int.parse(slittedCloseTime[0]),
      minute: int.parse(slittedCloseTime[1]),
    );

    final currentTimeOfDay = TimeOfDay.now();

    return currentTimeOfDay.isAfter(openTimeOfDay) &&
        currentTimeOfDay.isBefore(closeTimeOfDay);
  }
}
