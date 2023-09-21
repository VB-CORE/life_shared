import 'package:flutter/foundation.dart';
import 'package:life_shared/src/core/base_firebase_model.dart';
import 'package:life_shared/src/feature/firebase/custom_service.dart';
import 'package:life_shared/src/feature/firebase/enum/collection_paths.dart';
import 'package:life_shared/src/utility/custom_logger.dart';

@immutable
final class FirebaseService implements CustomService {
  @override
  Future<String?> add<T extends BaseFirebaseModel<T>>({
    required T model,
    required CollectionPaths path,
  }) async {
    try {
      final response = await path.collection.add(model.toJson());
      return response.id;
    } catch (error) {
      CustomLogger.log(error);
    }
    return null;
  }

  @override
  Future<List<T>> getList<T extends BaseFirebaseConvert<T>>({
    required T model,
    required CollectionPaths path,
  }) async {
    final response = await path.collection.withConverter<T?>(
      fromFirestore: (snapshot, options) {
        final data = snapshot.data();
        if (data == null) return null;
        try {
          return model.fromFirebase(snapshot);
        } catch (e) {
          CustomLogger.log(e);
          return null;
        }
      },
      toFirestore: (value, options) {
        throw UnimplementedError();
      },
    ).get();

    if (response.docs.isNotEmpty) {
      final values = response.docs
          .map((e) => e.data())
          .where((element) => element != null)
          .cast<T>()
          .toList();
      return values;
    }

    return [];
  }

  @override
  Future<T?> getSingleData<T extends BaseFirebaseConvert<T>>({
    required T model,
    required CollectionPaths path,
    required String id,
  }) async {
    final response = await path.collection.doc(id).withConverter<T?>(
      fromFirestore: (snapshot, options) {
        final data = snapshot.data();
        if (data == null) return null;
        try {
          return model.fromFirebase(snapshot);
        } catch (e) {
          CustomLogger.log(e);
          return null;
        }
      },
      toFirestore: (value, options) {
        throw UnimplementedError();
      },
    ).get();

    return response.data();
  }
}
