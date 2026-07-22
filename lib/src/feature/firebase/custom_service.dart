import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:life_shared/src/core/base_firebase_model.dart';
import 'package:life_shared/src/feature/firebase/enum/firestore_collection_path.dart';
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
    FirestoreCollectionPath path,
    T model,
  ) {
    throw UnimplementedError();
  }

  Query<T?> queryWithOrderBy<T extends BaseFirebaseConvert<T>>({
    required FirestoreCollectionPath path,
    required T model,
    required MapEntry<String, bool> orderBy,
  }) {
    throw UnimplementedError();
  }

  Future<String?> add<T extends BaseFirebaseModel<T>>({
    required T model,
    required FirestoreCollectionPath path,
  });

  Future<List<T>> getList<T extends BaseFirebaseConvert<T>>({
    required T model,
    required FirestoreCollectionPath path,
  });

  Future<T?> getSingleData<T extends BaseFirebaseConvert<T>>({
    required T model,
    required FirestoreCollectionPath path,
    required String id,
  });

  Future<bool> insertWithID<T extends BaseFirebaseModel<T>>({
    required FirestoreCollectionPath ref,
    required T model,
    String? key,
  });

  Future<bool> update<T extends BaseFirebaseModel<T>>(
    FirestoreCollectionPath ref,
    T model,
  );

  Future<bool> updateFields({
    required FirestoreCollectionPath ref,
    required String documentId,
    required Map<String, Object?> fields,
  });

  Future<bool> delete<T extends BaseFirebaseModel<T>>(
    FirestoreCollectionPath ref,
    T model,
  );

  Future<bool> deleteBy<T>(
    FirestoreCollectionPath ref,
    FirebaseRecordFields field,
    T value,
  );
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
