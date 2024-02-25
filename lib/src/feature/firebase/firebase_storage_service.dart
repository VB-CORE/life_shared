import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:kartal/kartal.dart';
import 'package:life_shared/src/feature/firebase/custom_service.dart';
import 'package:life_shared/src/feature/firebase/enum/file_sizes.dart';
import 'package:life_shared/src/feature/firebase/enum/root_storage.dart';
import 'package:life_shared/src/feature/firebase/enum/storage_types.dart';
import 'package:life_shared/src/feature/firebase/enum/upload_errors.dart';
import 'package:life_shared/src/utility/product_logger.dart';

class FirebaseStorageService with StorageCustomService {
  /// We need to test images png,jpg,webp,svg, and other file types.
  @override
  Future<String?> uploadImage({
    required RootStorageName root,
    required String key,
    required Uint8List fileBytes,
    StorageTypes type = StorageTypes.image,
  }) async {
    final storage = FirebaseStorage.instance;
    final name = '${root.name}/$key';
    try {
      await storage
          .ref(name)
          .putData(fileBytes, SettableMetadata(contentType: type.value));

      return storage.ref(name).getDownloadURL();
    } catch (error) {
      ProductLogger.log(error);
    }
    return null;
  }

  @override
  Future<(String?, UploadErrors?)> uploadFile({
    required RootStorageName root,
    required String key,
    required File? file,
    StorageTypes type = StorageTypes.pdf,
    FileSizes size = FileSizes.medium,
  }) async {
    if (file == null) return (null, UploadErrors.noFile);

    final fileSize = await file.length();
    if (fileSize > size.toByte) {
      ProductLogger.log('File size is bigger than ${size.toByte} bytes');
      return (null, UploadErrors.sizeLimit);
    }

    final storage = FirebaseStorage.instance;
    final name = '${root.name}/$key';
    try {
      await storage
          .ref(name)
          .putFile(file, SettableMetadata(contentType: type.value));

      /// does not use download url because of security rules
      /// if you want the file admin side it will help u
      ///
      /// Example:
      /// FirebaseStorage.instance.ref('scholarship').child('0419ce93-1ee5-4872-aeac-46eaaf72dae8').getDownloadURL();
      return (name, null);
    } catch (error) {
      ProductLogger.log(error);
    }
    return (null, UploadErrors.service);
  }

  @override
  Future<void> deleteAssets({required List<String>? paths}) async {
    final storage = FirebaseStorage.instance;
    if (paths.ext.isNullOrEmpty) return;
    for (final path in paths!) {
      if (path.isEmpty) continue;
      await storage.refFromURL(path).delete();
    }
  }

  Future<String> getDownloadUrl(String ref) {
    return FirebaseStorage.instance.ref(ref).getDownloadURL();
  }
}
