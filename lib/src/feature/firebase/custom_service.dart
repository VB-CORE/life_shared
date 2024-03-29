import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:life_shared/src/core/base_firebase_model.dart';
import 'package:life_shared/src/feature/firebase/enum/collection_paths.dart';
import 'package:life_shared/src/feature/firebase/enum/record_fields.dart';
import 'package:life_shared/src/feature/firebase/enum/root_storage.dart';
import 'package:life_shared/src/feature/firebase/enum/storage_types.dart';
import 'package:life_shared/src/feature/firebase/enum/upload_errors.dart';

abstract class CustomService {
  CustomService({this.timeoutDuration = const Duration(seconds: 10)});

  /// Timeout duration for all requests
  /// Default value is 10 seconds
  final Duration timeoutDuration;

  CollectionReference<T?> collectionReference<T extends BaseFirebaseConvert<T>>(
    CollectionPaths path,
    T model,
  ) {
    throw UnimplementedError();
  }

  Query<T?> queryWithOrderBy<T extends BaseFirebaseConvert<T>>({
    required CollectionPaths path,
    required T model,
    required MapEntry<String, bool> orderBy,
  }) {
    throw UnimplementedError();
  }

  Future<String?> add<T extends BaseFirebaseModel<T>>({
    required T model,
    required CollectionPaths path,
  });

  Future<List<T>> getList<T extends BaseFirebaseConvert<T>>({
    required T model,
    required CollectionPaths path,
  });

  Future<T?> getSingleData<T extends BaseFirebaseConvert<T>>({
    required T model,
    required CollectionPaths path,
    required String id,
  });

  Future<bool> insertWithID<T extends BaseFirebaseModel<T>>({
    required CollectionPaths ref,
    required T model,
    String? key,
  }) async {
    try {
      final collectionRef = ref.collection;
      await collectionRef.doc(key ?? model.documentId).set(model.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> update<T extends BaseFirebaseModel<T>>(
    CollectionPaths ref,
    T model,
  ) async {
    try {
      final collectionRef = ref.collection;
      await collectionRef.doc(model.documentId).update(model.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> delete<T extends BaseFirebaseModel<T>>(
    CollectionPaths ref,
    T model,
  ) async {
    try {
      final collectionRef = ref.collection;
      await collectionRef.doc(model.documentId).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteBy<T>(
    CollectionPaths ref,
    FirebaseRecordFields field,
    T value,
  ) async {
    final collectionRef = ref.collection;
    final snapshot = await collectionRef
        .where(
          field.name,
          isEqualTo: value,
        )
        .get();
    if (snapshot.docs.isEmpty) return false;
    for (final doc in snapshot.docs) {
      await doc.reference.delete();
    }
    return true;
  }
}

mixin StorageCustomService {
  Future<String?> uploadImage({
    required RootStorageName root,
    required String key,
    required Uint8List fileBytes,
    StorageTypes type = StorageTypes.image,
  });

  Future<(String?, UploadErrors?)> uploadFile({
    required RootStorageName root,
    required String key,
    required File file,
    StorageTypes type = StorageTypes.pdf,
  });

  Future<void> deleteAssets({required List<String>? paths});
}
