import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:life_shared/src/feature/firebase/enum/firestore_fields.dart';

/// The project never hard-deletes user content; a document is retired by
/// flipping [FirestoreFields.isDeleted]. This is the only place that field set
/// is spelled out.
@immutable
final class SoftDelete {
  const SoftDelete._();

  /// Field map for `updateFields` or a `WriteBatch.update`.
  ///
  /// Restoring (`isDeleted: false`) removes `deletedAt` instead of writing a
  /// null, so a restored document is indistinguishable from one never deleted.
  static Map<String, Object?> payload({bool isDeleted = true}) {
    return {
      FirestoreFields.isDeleted.name: isDeleted,
      FirestoreFields.deletedAt.name: isDeleted
          ? FieldValue.serverTimestamp()
          : FieldValue.delete(),
      FirestoreFields.updatedAt.name: FieldValue.serverTimestamp(),
    };
  }

  /// Keys [payload] touches, for `affects([...])` in security rules and for
  /// tests that assert the write stays a soft delete.
  static List<String> get affectedKeys => [
        FirestoreFields.isDeleted.name,
        FirestoreFields.deletedAt.name,
        FirestoreFields.updatedAt.name,
      ];
}
