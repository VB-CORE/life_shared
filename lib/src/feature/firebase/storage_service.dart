import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:life_shared/src/feature/firebase/custom_storage_service.dart';
import 'package:life_shared/src/feature/firebase/enum/file_sizes.dart';
import 'package:life_shared/src/feature/firebase/enum/root_storage.dart';
import 'package:life_shared/src/feature/firebase/enum/storage_types.dart';
import 'package:life_shared/src/feature/firebase/result/firebase_result.dart';
import 'package:life_shared/src/feature/firebase/result/storage_error.dart';
import 'package:life_shared/src/utility/product_logger.dart';

@immutable
final class StorageService extends CustomStorageService {
  const StorageService({super.timeoutDuration});

  @override
  Future<StorageResult<String>> uploadImage({
    required RootStorageName root,
    required String key,
    required Uint8List fileBytes,
    StorageTypes type = StorageTypes.image,
  }) {
    final name = '${root.name}/$key';
    return _guard(() async {
      final reference = FirebaseStorage.instance.ref(name);
      await reference.putData(
        fileBytes,
        SettableMetadata(contentType: type.value),
      );
      return reference.getDownloadURL();
    });
  }

  @override
  Future<StorageResult<String>> uploadFile({
    required RootStorageName root,
    required String key,
    required File? file,
    StorageTypes type = StorageTypes.pdf,
    FileSizes size = FileSizes.medium,
  }) async {
    if (file == null) return _failure(StorageError.noFile, null);

    final fileSize = await file.length();
    if (fileSize > size.toByte) {
      return _failure(
        StorageError.sizeLimit,
        '$fileSize bytes is bigger than ${size.toByte} bytes',
      );
    }

    final name = '${root.name}/$key';
    return _guard(() async {
      await FirebaseStorage.instance
          .ref(name)
          .putFile(file, SettableMetadata(contentType: type.value));
      return name;
    });
  }

  @override
  Future<StorageResult<int>> deleteAssets({required List<String>? paths}) {
    final assets = paths?.where((path) => path.isNotEmpty).toList() ?? [];
    if (assets.isEmpty) return Future.value(const FirebaseSuccess(0));

    return _guard(() async {
      var deleted = 0;
      for (final path in assets) {
        await FirebaseStorage.instance.refFromURL(path).delete();
        deleted++;
      }
      return deleted;
    });
  }

  @override
  Future<StorageResult<String>> getDownloadUrl(String ref) {
    return _guard(() => FirebaseStorage.instance.ref(ref).getDownloadURL());
  }

  Future<StorageResult<T>> _guard<T>(Future<T> Function() request) async {
    try {
      return FirebaseSuccess(await request().timeout(timeoutDuration));
    } on TimeoutException {
      return _failure(
        StorageError.timeout,
        'No response in ${timeoutDuration.inSeconds}s',
      );
    } on FirebaseException catch (error) {
      return _failure(StorageError.fromCode(error.code), error.message);
    } catch (error) {
      return _failure(StorageError.unknown, '$error');
    }
  }

  StorageResult<T> _failure<T>(StorageError error, String? message) {
    ProductLogger.log('StorageService ${error.name}: ${message ?? ''}');
    return FirebaseFailure(error, message: message);
  }
}
