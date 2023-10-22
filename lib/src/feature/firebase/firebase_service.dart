import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:life_shared/src/core/base_firebase_model.dart';
import 'package:life_shared/src/feature/firebase/custom_service.dart';
import 'package:life_shared/src/feature/firebase/enum/collection_paths.dart';
import 'package:life_shared/src/utility/product_logger.dart';

@immutable
class FirebaseService extends CustomService with _FirebaseServiceError {
  FirebaseService({super.timeoutDuration});

  @override
  Future<String?> add<T extends BaseFirebaseModel<T>>({
    required T model,
    required CollectionPaths path,
  }) async {
    final request = path.collection.add(model.toJson());
    final response = await _withTimeout(request);
    if (response == null) return null;
    return response.id;
  }

  @override
  Future<List<T>> getList<T extends BaseFirebaseConvert<T>>({
    required T model,
    required CollectionPaths path,
  }) async {
    final request = collectionReference(path, model).get();

    final response = await _withTimeout(request);
    if (response == null) return [];
    if (response.docs.isEmpty) return [];
    return response.docs.map((e) => e.data()).where((element) => element != null).cast<T>().toList();
  }

  @override
  CollectionReference<T?> collectionReference<T extends BaseFirebaseConvert<T>>(
    CollectionPaths path,
    T model,
  ) {
    return path.collection.withConverter<T?>(
      fromFirestore: (snapshot, options) => _dataConvert(snapshot, model),
      toFirestore: (value, options) => throw UnimplementedError(),
    );
  }

  @override
  Future<T?> getSingleData<T extends BaseFirebaseConvert<T>>({
    required T model,
    required CollectionPaths path,
    required String id,
  }) async {
    final request = path.collection.doc(id).withConverter<T?>(
      fromFirestore: (snapshot, options) {
        return _dataConvert(snapshot, model);
      },
      toFirestore: (value, options) {
        throw UnimplementedError();
      },
    ).get();

    final response = await _withTimeout(request);
    return response?.data();
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

  T? _dataConvert<T>(
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
