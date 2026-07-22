// This file only bridges the old API to StorageService.
// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:io';
import 'dart:typed_data';

import 'package:life_shared/src/feature/firebase/custom_service.dart';
import 'package:life_shared/src/feature/firebase/enum/file_sizes.dart';
import 'package:life_shared/src/feature/firebase/enum/root_storage.dart';
import 'package:life_shared/src/feature/firebase/enum/storage_types.dart';
import 'package:life_shared/src/feature/firebase/enum/upload_errors.dart';
import 'package:life_shared/src/feature/firebase/result/firebase_result.dart';
import 'package:life_shared/src/feature/firebase/result/storage_error.dart';
import 'package:life_shared/src/feature/firebase/storage_service.dart';

/// Delegates to [StorageService] and collapses the error, kept only for the
/// existing callers.
@Deprecated(
  'Use StorageService, it returns StorageResult so upload and delete errors '
  'are no longer swallowed',
)
class FirebaseStorageService with StorageCustomService {
  final StorageService _delegate = const StorageService();

  @override
  Future<String?> uploadImage({
    required RootStorageName root,
    required String key,
    required Uint8List fileBytes,
    StorageTypes type = StorageTypes.image,
  }) async {
    final result = await _delegate.uploadImage(
      root: root,
      key: key,
      fileBytes: fileBytes,
      type: type,
    );
    return result.dataOrNull;
  }

  @override
  Future<(String?, UploadErrors?)> uploadFile({
    required RootStorageName root,
    required String key,
    required File? file,
    StorageTypes type = StorageTypes.pdf,
    FileSizes size = FileSizes.medium,
  }) async {
    final result = await _delegate.uploadFile(
      root: root,
      key: key,
      file: file,
      type: type,
      size: size,
    );
    return switch (result) {
      FirebaseSuccess(:final data) => (data, null),
      FirebaseFailure(:final error) => (null, _toUploadError(error)),
    };
  }

  @override
  Future<void> deleteAssets({required List<String>? paths}) async {
    await _delegate.deleteAssets(paths: paths);
  }

  /// Returns an empty string when the url cannot be read
  Future<String> getDownloadUrl(String ref) async {
    final result = await _delegate.getDownloadUrl(ref);
    return result.dataOrNull ?? '';
  }

  UploadErrors _toUploadError(StorageError error) => switch (error) {
        StorageError.noFile => UploadErrors.noFile,
        StorageError.sizeLimit => UploadErrors.sizeLimit,
        _ => UploadErrors.service,
      };
}
