import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:life_shared/src/core/base_firebase_model.dart';
import 'package:life_shared/src/feature/firebase/enum/firestore_collection_path.dart';
import 'package:life_shared/src/feature/firebase/enum/record_fields.dart';
import 'package:life_shared/src/feature/firebase/result/firebase_result.dart';

/// Every call returns a [FirestoreResult], so the caller can tell a real
/// failure apart from an empty collection or a missing document.
abstract class CustomFirestoreService {
  const CustomFirestoreService({
    this.timeoutDuration = const Duration(seconds: 10),
  });

  final Duration timeoutDuration;

  /// Returns the id of the created document
  Future<FirestoreResult<String>> add<T extends BaseFirebaseModel<T>>({
    required T model,
    required FirestoreCollectionPath path,
  });

  /// Returns the key the document was written with
  Future<FirestoreResult<String>> insertWithID<T extends BaseFirebaseModel<T>>({
    required FirestoreCollectionPath path,
    required T model,
    String? key,
  });

  Future<FirestoreResult<String>> update<T extends BaseFirebaseModel<T>>({
    required FirestoreCollectionPath path,
    required T model,
  });

  Future<FirestoreResult<String>> updateFields({
    required FirestoreCollectionPath path,
    required String documentId,
    required Map<String, Object?> fields,
  });

  Future<FirestoreResult<String>> delete<T extends BaseFirebaseModel<T>>({
    required FirestoreCollectionPath path,
    required T model,
  });

  /// Returns how many documents were deleted
  Future<FirestoreResult<int>> deleteBy<T>({
    required FirestoreCollectionPath path,
    required FirebaseRecordFields field,
    required T value,
  });

  /// An empty collection is a success with an empty list.
  /// Documents that cannot be parsed are skipped and logged.
  Future<FirestoreResult<List<T>>> getList<T extends BaseFirebaseConvert<T>>({
    required T model,
    required FirestoreCollectionPath path,
  });

  /// A missing document is a success with `null` data, a document that cannot
  /// be parsed is a `FirestoreError.parse` failure.
  Future<FirestoreResult<T?>> getSingleData<T extends BaseFirebaseConvert<T>>({
    required T model,
    required FirestoreCollectionPath path,
    required String id,
  });

  CollectionReference<T?> collectionReference<T extends BaseFirebaseConvert<T>>(
    FirestoreCollectionPath path,
    T model,
  );

  Query<T?> queryWithOrderBy<T extends BaseFirebaseConvert<T>>({
    required FirestoreCollectionPath path,
    required T model,
    required MapEntry<String, bool> orderBy,
  });
}
