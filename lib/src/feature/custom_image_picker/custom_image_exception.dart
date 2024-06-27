import 'package:collection/collection.dart';

enum CustomImageException {
  unknown('unknown'),
  photoAccessDenied('photo_access_denied'),
  cameraAccessDenied('camera_access_denied');

  final String value;
  const CustomImageException(this.value);

  static CustomImageException? fromValue(String? value) {
    if (value == null) return null;
    return CustomImageException.values.firstWhereOrNull(
      (element) => element.value == value,
    );
  }
}
