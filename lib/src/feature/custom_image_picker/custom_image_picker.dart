import 'dart:io';

import 'package:flutter/material.dart';
import 'package:life_shared/src/feature/custom_image_picker/custom_image_exception.dart';
import 'package:life_shared/src/feature/custom_image_picker/custom_image_pick_type.dart';

abstract class CustomImagePicker {
  CustomImagePicker({required this.title});

  final String title;

  /// Pick photo from gallery or camera
  /// [type] [CustomImagePickType.gallery] or [CustomImagePickType.camera
  /// [onError] [CustomImageException] callback when error occurred
  ///
  /// Return [File] if success, [null] if failed
  Future<File?> pickPhoto({
    required CustomImagePickType type,
    ValueChanged<CustomImageException>? onError,
  });
}
