import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:life_shared/src/core/base_firebase_model.dart';
import 'package:life_shared/src/feature/firebase/custom_firestore_service.dart';
import 'package:life_shared/src/feature/firebase/enum/firestore_collection_path.dart';
import 'package:life_shared/src/feature/firebase/enum/record_fields.dart';
import 'package:life_shared/src/feature/firebase/result/firebase_result.dart';
import 'package:life_shared/src/feature/firebase/result/firestore_error.dart';
import 'package:life_shared/src/utility/product_logger.dart';

@immutable
final class FirestoreService extends CustomFirestoreService {
  const FirestoreService({super.timeoutDuration});

  @override
  Future<FirestoreResult<String>> add<T extends BaseFirebaseModel<T>>({
    required T model,
    required FirestoreCollectionPath path,
  }) {
    return _guard(() async {
      final document = await path.collection.add(model.toJson());
      return document.id;
    });
  }

  @override
  Future<FirestoreResult<String>> insertWithID<T extends BaseFirebaseModel<T>>({
    required FirestoreCollectionPath path,
    required T model,
    String? key,
  }) {
    final documentId = key ?? model.documentId;
    return _guard(() async {
      await path.collection.doc(documentId).set(model.toJson());
      return documentId;
    });
  }

  @override
  Future<FirestoreResult<String>> update<T extends BaseFirebaseModel<T>>({
    required FirestoreCollectionPath path,
    required T model,
  }) {
    return _guard(() async {
      await path.collection.doc(model.documentId).update(model.toJson());
      return model.documentId;
    });
  }

  @override
  Future<FirestoreResult<String>> updateFields({
    required FirestoreCollectionPath path,
    required String documentId,
    required Map<String, Object?> fields,
  }) async {
    if (fields.isEmpty) {
      return _failure(FirestoreError.invalidArgument, 'fields is empty');
    }
    return _guard(() async {
      await path.collection.doc(documentId).update(fields);
      return documentId;
    });
  }

  @override
  Future<FirestoreResult<String>> delete<T extends BaseFirebaseModel<T>>({
    required FirestoreCollectionPath path,
    required T model,
  }) {
    return _guard(() async {
      await path.collection.doc(model.documentId).delete();
      return model.documentId;
    });
  }

  @override
  Future<FirestoreResult<int>> deleteBy<T>({
    required FirestoreCollectionPath path,
    required FirebaseRecordFields field,
    required T value,
  }) {
    return _guard(() async {
      final snapshot =
          await path.collection.where(field.name, isEqualTo: value).get();
      for (final document in snapshot.docs) {
        await document.reference.delete();
      }
      return snapshot.docs.length;
    });
  }

  @override
  Future<FirestoreResult<List<T>>> getList<T extends BaseFirebaseConvert<T>>({
    required T model,
    required FirestoreCollectionPath path,
  }) {
    return _guard(() async {
      final snapshot = await path.collection.get();
      final items = <T>[];
      for (final document in snapshot.docs) {
        final item = _tryConvert<T>(document, model);
        if (item != null) items.add(item);
      }
      return items;
    });
  }

  @override
  Future<FirestoreResult<T?>> getSingleData<T extends BaseFirebaseConvert<T>>({
    required T model,
    required FirestoreCollectionPath path,
    required String id,
  }) {
    return _guard(() async {
      final snapshot = await path.collection.doc(id).get();
      if (!snapshot.exists) return null;
      try {
        return model.fromFirebase(snapshot);
      } catch (error) {
        throw _ConvertException('${snapshot.reference.path} $error');
      }
    });
  }

  @override
  CollectionReference<T?> collectionReference<T extends BaseFirebaseConvert<T>>(
    FirestoreCollectionPath path,
    T model,
  ) {
    return path.collection.withConverter<T?>(
      fromFirestore: _fromFirestoreOf<T>(model),
      toFirestore: _unsupportedToFirestore<T?>,
    );
  }

  @override
  Query<T?> queryWithOrderBy<T extends BaseFirebaseConvert<T>>({
    required FirestoreCollectionPath path,
    required T model,
    required MapEntry<String, bool> orderBy,
  }) {
    return path.collection
        .orderBy(orderBy.key, descending: orderBy.value)
        .withConverter<T?>(
          fromFirestore: _fromFirestoreOf<T>(model),
          toFirestore: _unsupportedToFirestore<T?>,
        );
  }

  Future<FirestoreResult<T>> _guard<T>(Future<T> Function() request) async {
    try {
      return FirebaseSuccess(await request().timeout(timeoutDuration));
    } on TimeoutException {
      return _failure(
        FirestoreError.timeout,
        'No response in ${timeoutDuration.inSeconds}s',
      );
    } on _ConvertException catch (error) {
      return _failure(FirestoreError.parse, error.message);
    } on FirebaseException catch (error) {
      return _failure(FirestoreError.fromCode(error.code), error.message);
    } catch (error) {
      return _failure(FirestoreError.unknown, '$error');
    }
  }

  FirestoreResult<T> _failure<T>(FirestoreError error, String? message) {
    ProductLogger.log('FirestoreService ${error.name}: ${message ?? ''}');
    return FirebaseFailure(error, message: message);
  }

  T? _tryConvert<T extends BaseFirebaseConvert<T>>(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    T model,
  ) {
    try {
      return model.fromFirebase(snapshot);
    } catch (error) {
      ProductLogger.log(
        'FirestoreService ${FirestoreError.parse.name}: '
        '${snapshot.reference.path} $error',
      );
      return null;
    }
  }

  /// Query equality covers the converters, a new closure per call would make
  /// listeners resubscribe on every rebuild
  static final Map<Type, Function> _fromFirestoreCache = {};

  FromFirestore<T?> _fromFirestoreOf<T extends BaseFirebaseConvert<T>>(
    T model,
  ) {
    final converter = _fromFirestoreCache.putIfAbsent(
      model.runtimeType,
      () => (
        DocumentSnapshot<Map<String, dynamic>> snapshot,
        SnapshotOptions? options,
      ) =>
          snapshot.data() == null ? null : _tryConvert<T>(snapshot, model),
    );
    return converter as FromFirestore<T?>;
  }

  static Map<String, Object?> _unsupportedToFirestore<T>(
    T value,
    SetOptions? options,
  ) {
    throw UnimplementedError();
  }
}

class _ConvertException implements Exception {
  const _ConvertException(this.message);

  final String message;
}
