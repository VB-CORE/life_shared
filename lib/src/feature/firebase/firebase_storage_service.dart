import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:kartal/kartal.dart';
import 'package:life_shared/src/feature/firebase/custom_service.dart';
import 'package:life_shared/src/feature/firebase/enum/file_sizes.dart';
import 'package:life_shared/src/feature/firebase/enum/root_storage.dart';
import 'package:life_shared/src/feature/firebase/enum/storage_types.dart';
import 'package:life_shared/src/utility/custom_logger.dart';
import 'package:uuid/uuid.dart';

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
      await storage.ref(name).putData(fileBytes, SettableMetadata(contentType: type.value));

      return storage.ref(name).getDownloadURL();
    } catch (error) {
      CustomLogger.log(error);
    }
    return null;
  }

  @override
  Future<String?> uploadFile({
    required RootStorageName root,
    required String key,
    required File file,
    StorageTypes type = StorageTypes.pdf,
    FileSizes size = FileSizes.medium,
  }) async {
    final fileSize = await file.length();
    if (fileSize > size.toByte) {
      CustomLogger.log('File size is bigger than ${size.toByte} bytes');
      return null;
    }

    final storage = FirebaseStorage.instance;
    final name = '${root.name}/$key';
    try {
      await storage.ref(name).putFile(file, SettableMetadata(contentType: type.value));

      return storage.ref(name).getDownloadURL();
    } catch (error) {
      CustomLogger.log(error);
    }
    return null;
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

  @override
  Future<String?> fileTransaction(String? url, RootStorageName to) async {
    if (url.ext.isNullOrEmpty) return null;
    final storage = FirebaseStorage.instance;
    final oldRef = storage.refFromURL(url!);
    try {
      final data = await oldRef.getData();
      if (data.ext.isNullOrEmpty) return null;
      final newKey = const Uuid().v4();
      final newUrl = await uploadImage(root: to, key: newKey, fileBytes: data!);
      if (newUrl.ext.isNullOrEmpty) return null;
      await oldRef.delete();
      return newUrl;
    } catch (e) {
      CustomLogger.log(e);
      return null;
    }
  }
}
