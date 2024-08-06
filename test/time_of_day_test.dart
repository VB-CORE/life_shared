import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_shared/life_shared.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<StoreModel>()])
import 'time_of_day_test.mocks.dart';

void main() {
  List<TimeOfDay> generateTimeCombinations() {
    final hours = List.generate(24, (index) => index);
    final minutes = List.generate(2, (index) => index * 30);
    final times = hours
        .expand(
          (hour) => minutes.map(
            (minute) => TimeOfDay(hour: hour, minute: minute),
          ),
        )
        .toList();
    return times;
  }

  final timeCombinations = generateTimeCombinations();

  String formatTimeOfDay(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  group('isStoreOpen mock tests', () {
    final outputFile = File('time_of_day_output.txt');
    final outputSink = outputFile.openWrite();
    final now = TimeOfDay.now();

    for (final openTime in timeCombinations) {
      for (final closeTime in timeCombinations) {
        final desc = 'now: ${formatTimeOfDay(now)} '
            'openTime: ${formatTimeOfDay(openTime)}, '
            'closeTime: ${formatTimeOfDay(closeTime)}';
        test(desc, () {
          final model = MockStoreModel();

          when(model.openTime).thenReturn(formatTimeOfDay(openTime));
          when(model.closeTime).thenReturn(formatTimeOfDay(closeTime));

          final storeModelHelper = StoreModelHelper(model: model);

          final currentTime = TimeOfDay.now();
          final isOpen = storeModelHelper.isStoreOpen;

          late final bool expectedIsOpen;
          if (openTime.isBefore(closeTime)) {
            expectedIsOpen = currentTime.isAfter(openTime) &&
                currentTime.isBefore(closeTime);
          } else {
            expectedIsOpen = currentTime.isAfter(openTime) ||
                currentTime.isBefore(closeTime);
          }
          expect(isOpen, expectedIsOpen);
          final outputLine = '$desc :: isOpen: $isOpen\n';
          outputSink.write(outputLine);
        });
      }
    }
    tearDown(outputSink.close);
  });
}
