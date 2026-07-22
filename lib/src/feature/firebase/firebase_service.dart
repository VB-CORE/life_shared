import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:life_shared/src/core/base_firebase_model.dart';
import 'package:life_shared/src/feature/firebase/custom_service.dart';
import 'package:life_shared/src/feature/firebase/enum/firestore_collection_path.dart';
import 'package:life_shared/src/feature/firebase/enum/record_fields.dart';
import 'package:life_shared/src/utility/product_logger.dart';

@immutable
class FirebaseService extends CustomService with _FirebaseServiceError {
  FirebaseService({super.timeoutDuration});

  @override
  Future<String?> add<T extends BaseFirebaseModel<T>>({
    required T model,
    required FirestoreCollectionPath path,
  }) async {
    final request = path.collection.add(model.toJson());
    final response = await _withTimeout(request);
    if (response == null) return null;
    return response.id;
  }

  @override
  Future<bool> insertWithID<T extends BaseFirebaseModel<T>>({
    required FirestoreCollectionPath ref,
    required T model,
    String? key,
  }) async {
    final request = ref.collection
        .doc(key ?? model.documentId)
        .set(model.toJson())
        .then((_) => true);
    final response = await _withTimeout(request);
    return response ?? false;
  }

  @override
  Future<bool> update<T extends BaseFirebaseModel<T>>(
    FirestoreCollectionPath ref,
    T model,
  ) async {
    final request = ref.collection
        .doc(model.documentId)
        .update(model.toJson())
        .then((_) => true);
    final response = await _withTimeout(request);
    return response ?? false;
  }

  @override
  Future<bool> updateFields({
    required FirestoreCollectionPath ref,
    required String documentId,
    required Map<String, Object?> fields,
  }) async {
    if (fields.isEmpty) return false;
    final request =
        ref.collection.doc(documentId).update(fields).then((_) => true);
    final response = await _withTimeout(request);
    return response ?? false;
  }

  @override
  Future<bool> delete<T extends BaseFirebaseModel<T>>(
    FirestoreCollectionPath ref,
    T model,
  ) async {
    final request =
        ref.collection.doc(model.documentId).delete().then((_) => true);
    final response = await _withTimeout(request);
    return response ?? false;
  }

  @override
  Future<bool> deleteBy<T>(
    FirestoreCollectionPath ref,
    FirebaseRecordFields field,
    T value,
  ) async {
    Future<bool> query() async {
      final snapshot =
          await ref.collection.where(field.name, isEqualTo: value).get();
      if (snapshot.docs.isEmpty) return false;
      for (final doc in snapshot.docs) {
        await doc.reference.delete();
      }
      return true;
    }

    final response = await _withTimeout(query());
    return response ?? false;
  }

  @override
  Future<List<T>> getList<T extends BaseFirebaseConvert<T>>({
    required T model,
    required FirestoreCollectionPath path,
  }) async {
    final request = collectionReference(path, model).get();

    final response = await _withTimeout(request);
    if (response == null) return [];
    if (response.docs.isEmpty) return [];
    return response.docs
        .map((e) => e.data())
        .where((element) => element != null)
        .cast<T>()
        .toList();
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

  @override
  Future<T?> getSingleData<T extends BaseFirebaseConvert<T>>({
    required T model,
    required FirestoreCollectionPath path,
    required String id,
  }) async {
    final request = path.collection
        .doc(id)
        .withConverter<T?>(
          fromFirestore: _fromFirestoreOf<T>(model),
          toFirestore: _unsupportedToFirestore<T?>,
        )
        .get();

    final response = await _withTimeout(request);
    return response?.data();
  }

  static Map<String, Object?> _unsupportedToFirestore<T>(
    T value,
    SetOptions? options,
  ) {
    throw UnimplementedError();
  }
}

mixin _FirebaseServiceError on CustomService {
  Future<T?> _withTimeout<T>(
    Future<T> request,
  ) async {
    try {
      final response = await request.timeout(timeoutDuration);
      return response;
    } catch (e) {
      ProductLogger.log('$T $e');
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
          _dataConvert<T>(snapshot, model),
    );
    return converter as FromFirestore<T?>;
  }

  static T? _dataConvert<T>(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    BaseFirebaseConvert<T> model,
  ) {
    final data = snapshot.data();
    if (data == null) return null;
    try {
      return model.fromFirebase(snapshot);
    } catch (e) {
      ProductLogger.log(e);
      return null;
    }
  }
}
