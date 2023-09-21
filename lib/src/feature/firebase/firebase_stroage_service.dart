import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:life_shared/src/feature/firebase/custom_service.dart';
import 'package:life_shared/src/feature/firebase/enum/root_storage.dart';

import 'package:life_shared/src/feature/firebase/enum/stroage_types.dart';

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
      final downloadURL = await storage.ref(name).getDownloadURL();
      return downloadURL;
    } catch (_) {}
    return null;
  }
}
