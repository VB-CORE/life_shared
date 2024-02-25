import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:life_shared/src/feature/file/file_qualities.dart';

final class FileCompress {
  FileCompress(this.fileBytes);

  final Uint8List fileBytes;

  /// The function compresses a byte file using FlutterImageCompress library and returns the compressed byte data.
  ///
  /// Args:
  ///   quality (FileQualities): The `quality` parameter is an optional parameter of type `FileQualities` which specifies
  /// the desired quality of the compressed file. It has a default value of `FileQualities.medium`. Defaults to
  /// FileQualities
  ///
  /// Returns:
  ///   a `Future` object that resolves to a `Uint8List?` (nullable `Uint8List`) value.
  Future<Uint8List?> compressByteFile({
    FileQualities quality = FileQualities.medium,
  }) async {
    final result = await FlutterImageCompress.compressWithList(
      fileBytes,
      quality: quality.value,
    );
    return result;
  }
}
