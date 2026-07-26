import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:life_shared/src/feature/firebase/enum/firestore_fields.dart';

/// The project never hard-deletes user content; a document is retired by
/// flipping [FirestoreFields.isDeleted].
@immutable
final class SoftDelete {
  const SoftDelete._();

  /// Field map for `updateFields` or a `WriteBatch.update`. Restoring removes
  /// `deletedAt` rather than writing a null.
  static Map<String, Object?> payload({bool isDeleted = true}) {
    return {
      FirestoreFields.isDeleted.name: isDeleted,
      FirestoreFields.deletedAt.name:
          isDeleted ? FieldValue.serverTimestamp() : FieldValue.delete(),
      FirestoreFields.updatedAt.name: FieldValue.serverTimestamp(),
    };
  }

  /// Keys [payload] touches, matching `affects([...])` in the security rules.
  static List<String> get affectedKeys => [
        FirestoreFields.isDeleted.name,
        FirestoreFields.deletedAt.name,
        FirestoreFields.updatedAt.name,
      ];
}
