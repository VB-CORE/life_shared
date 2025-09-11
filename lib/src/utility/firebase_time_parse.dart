import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

@immutable
class FirebaseTimeParse {
  const FirebaseTimeParse._();

  static DateTime? datetimeFromTimestamp(dynamic timestamp) {
    if (timestamp == null) return null;

    // If it's already a Timestamp, convert it directly
    if (timestamp is Timestamp) {
      return DateTime.fromMillisecondsSinceEpoch(
          timestamp.millisecondsSinceEpoch);
    }

    // If it's a String, try to parse it as DateTime
    if (timestamp is String) {
      try {
        return DateTime.parse(timestamp);
      } catch (e) {
        if (kDebugMode) {
          debugPrint('Error parsing timestamp string: $e');
        }
        return null;
      }
    }
    if (kDebugMode) {
      debugPrint('Unsupported timestamp type: ${timestamp.runtimeType}');
    }
    return null;
  }

  static Timestamp? dateTimeToTimestamp(DateTime? datetime) {
    return datetime != null ? Timestamp.fromDate(datetime) : null;
  }
}
