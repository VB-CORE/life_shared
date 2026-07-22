// This file only bridges the old API to FirestoreService, so it has to use the
// deprecated CustomService and needs the timeout value in the initializer list.
// ignore_for_file: deprecated_member_use_from_same_package, use_super_parameters

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:life_shared/src/core/base_firebase_model.dart';
import 'package:life_shared/src/feature/firebase/custom_service.dart';
import 'package:life_shared/src/feature/firebase/enum/firestore_collection_path.dart';
import 'package:life_shared/src/feature/firebase/enum/record_fields.dart';
import 'package:life_shared/src/feature/firebase/firestore_service.dart';

/// Delegates to [FirestoreService] and drops the error, kept only for the
/// existing callers.
@Deprecated(
  'Use FirestoreService, it returns FirestoreResult so timeout, permission '
  'and parse errors are no longer swallowed',
)
@immutable
class FirebaseService extends CustomService {
  @Deprecated('Use FirestoreService')
  FirebaseService({Duration timeoutDuration = const Duration(seconds: 10)})
      : _delegate = FirestoreService(timeoutDuration: timeoutDuration),
        super(timeoutDuration: timeoutDuration);

  final FirestoreService _delegate;

  @override
  Future<String?> add<T extends BaseFirebaseModel<T>>({
    required T model,
    required FirestoreCollectionPath path,
  }) async {
    final result = await _delegate.add(model: model, path: path);
    return result.dataOrNull;
  }

  @override
  Future<bool> insertWithID<T extends BaseFirebaseModel<T>>({
    required FirestoreCollectionPath ref,
    required T model,
    String? key,
  }) async {
    final result = await _delegate.insertWithID(
      path: ref,
      model: model,
      key: key,
    );
    return result.isSuccess;
  }

  @override
  Future<bool> update<T extends BaseFirebaseModel<T>>(
    FirestoreCollectionPath ref,
    T model,
  ) async {
    final result = await _delegate.update(path: ref, model: model);
    return result.isSuccess;
  }

  @override
  Future<bool> updateFields({
    required FirestoreCollectionPath ref,
    required String documentId,
    required Map<String, Object?> fields,
  }) async {
    final result = await _delegate.updateFields(
      path: ref,
      documentId: documentId,
      fields: fields,
    );
    return result.isSuccess;
  }

  @override
  Future<bool> delete<T extends BaseFirebaseModel<T>>(
    FirestoreCollectionPath ref,
    T model,
  ) async {
    final result = await _delegate.delete(path: ref, model: model);
    return result.isSuccess;
  }

  @override
  Future<bool> deleteBy<T>(
    FirestoreCollectionPath ref,
    FirebaseRecordFields field,
    T value,
  ) async {
    final result = await _delegate.deleteBy(
      path: ref,
      field: field,
      value: value,
    );
    return (result.dataOrNull ?? 0) > 0;
  }

  @override
  Future<List<T>> getList<T extends BaseFirebaseConvert<T>>({
    required T model,
    required FirestoreCollectionPath path,
  }) async {
    final result = await _delegate.getList(model: model, path: path);
    return result.dataOrNull ?? [];
  }

  @override
  Future<T?> getSingleData<T extends BaseFirebaseConvert<T>>({
    required T model,
    required FirestoreCollectionPath path,
    required String id,
  }) async {
    final result = await _delegate.getSingleData(
      model: model,
      path: path,
      id: id,
    );
    return result.dataOrNull;
  }

  @override
  CollectionReference<T?> collectionReference<T extends BaseFirebaseConvert<T>>(
    FirestoreCollectionPath path,
    T model,
  ) {
    return _delegate.collectionReference(path, model);
  }

  @override
  Query<T?> queryWithOrderBy<T extends BaseFirebaseConvert<T>>({
    required FirestoreCollectionPath path,
    required T model,
    required MapEntry<String, bool> orderBy,
  }) {
    return _delegate.queryWithOrderBy(
      path: path,
      model: model,
      orderBy: orderBy,
    );
  }
}
