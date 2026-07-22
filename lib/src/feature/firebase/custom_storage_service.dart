import 'dart:io';
import 'dart:typed_data';

import 'package:life_shared/src/feature/firebase/enum/file_sizes.dart';
import 'package:life_shared/src/feature/firebase/enum/root_storage.dart';
import 'package:life_shared/src/feature/firebase/enum/storage_types.dart';
import 'package:life_shared/src/feature/firebase/result/firebase_result.dart';

/// Every call returns a [StorageResult]. Uploads get a longer timeout than
/// Firestore calls, a large file over a slow connection is not a failure.
abstract class CustomStorageService {
  const CustomStorageService({
    this.timeoutDuration = const Duration(seconds: 60),
  });

  final Duration timeoutDuration;

  /// Returns the download url of the uploaded image
  Future<StorageResult<String>> uploadImage({
    required RootStorageName root,
    required String key,
    required Uint8List fileBytes,
    StorageTypes type = StorageTypes.image,
  });

  /// Returns the storage path of the uploaded file, not a download url,
  /// because the security rules keep these files admin only
  Future<StorageResult<String>> uploadFile({
    required RootStorageName root,
    required String key,
    required File? file,
    StorageTypes type = StorageTypes.pdf,
    FileSizes size = FileSizes.medium,
  });

  /// Returns how many assets were deleted. Stops on the first failure, so the
  /// remaining paths stay in storage.
  Future<StorageResult<int>> deleteAssets({required List<String>? paths});

  Future<StorageResult<String>> getDownloadUrl(String ref);
}
