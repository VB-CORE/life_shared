import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:life_shared/life_shared.dart';
import 'package:life_shared/src/feature/custom_image_picker/custom_image_exception.dart';
import 'package:life_shared/src/feature/custom_image_picker/custom_image_pick_type.dart';
import 'package:life_shared/src/feature/custom_image_picker/custom_image_picker.dart';

@immutable
final class PhotoPickerManager implements CustomImagePicker {
  PhotoPickerManager({required this.title});

  final ImagePicker _picker = ImagePicker();

  @override
  final String title;
  @override
  Future<File?> pickPhoto({
    required CustomImagePickType type,
    ValueChanged<CustomImageException>? onError,
  }) async {
    XFile? mediaFile;
    try {
      switch (type) {
        case CustomImagePickType.gallery:
          mediaFile = await _picker.pickImage(source: ImageSource.gallery);
        case CustomImagePickType.camera:
          mediaFile = await _picker.pickImage(source: ImageSource.camera);
      }
    } on PlatformException catch (e) {
      onError?.call(
        CustomImageException.fromValue(e.message) ??
            CustomImageException.unknown,
      );
    }
    if (mediaFile == null) return null;

    final croppedFile = await ImageCropper().cropImage(
      sourcePath: mediaFile.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: title,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true,
          aspectRatioPresets: [
            CropAspectRatioPreset.ratio4x3,
          ],
        ),
        IOSUiSettings(
          title: title,
          aspectRatioPresets: [
            CropAspectRatioPreset.ratio4x3,
          ],
        ),
      ],
    );
    if (croppedFile == null) return null;
    return _compressCroppedImage(croppedFile);
  }

  /// Compress the cropped image file
  Future<File?> _compressCroppedImage(CroppedFile file) async {
    final latestFile = File(file.path);
    final latestFileCompress =
        await FileCompress(await latestFile.readAsBytes()).compressByteFile();
    if (latestFileCompress == null) return null;
    await latestFile.writeAsBytes(latestFileCompress);
    return latestFile;
  }
}
