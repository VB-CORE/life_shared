import 'dart:typed_data';

import 'package:life_shared/src/core/base_firebase_model.dart';
import 'package:life_shared/src/feature/firebase/enum/collection_paths.dart';
import 'package:life_shared/src/feature/firebase/enum/root_storage.dart';
import 'package:life_shared/src/feature/firebase/enum/stroage_types.dart';

abstract class CustomService {
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
}

mixin StorageCustomService {
  Future<String?> uploadImage({
    required RootStorageName root,
    required String key,
    required Uint8List fileBytes,
    StorageTypes type = StorageTypes.image,
  });
}
