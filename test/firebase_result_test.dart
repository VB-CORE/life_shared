import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:life_shared/life_shared.dart';

void main() {
  group('FirebaseResult', () {
    test('success exposes its data', () {
      const FirestoreResult<int> result = FirebaseSuccess(3);

      expect(result.isSuccess, isTrue);
      expect(result.dataOrNull, 3);
    });

    test('failure keeps the error and has no data', () {
      const FirestoreResult<int> result = FirebaseFailure(
        FirestoreError.timeout,
        message: 'No response in 10s',
      );

      expect(result.isSuccess, isFalse);
      expect(result.dataOrNull, isNull);
      expect(
        switch (result) {
          FirebaseSuccess() => null,
          FirebaseFailure(:final error) => error,
        },
        FirestoreError.timeout,
      );
    });
  });

  group('FirestoreError.fromCode', () {
    test('maps the codes the caller can react to', () {
      expect(
        FirestoreError.fromCode('permission-denied'),
        FirestoreError.permissionDenied,
      );
      expect(
        FirestoreError.fromCode('unauthenticated'),
        FirestoreError.unauthenticated,
      );
      expect(FirestoreError.fromCode('not-found'), FirestoreError.notFound);
      expect(
        FirestoreError.fromCode('deadline-exceeded'),
        FirestoreError.unavailable,
      );
      expect(
        FirestoreError.fromCode('invalid-argument'),
        FirestoreError.invalidArgument,
      );
    });

    test('falls back to unknown', () {
      expect(FirestoreError.fromCode('data-loss'), FirestoreError.unknown);
      expect(FirestoreError.fromCode(''), FirestoreError.unknown);
    });
  });

  group('StorageError.fromCode', () {
    test('maps the codes the caller can react to', () {
      expect(StorageError.fromCode('unauthorized'), StorageError.unauthorized);
      expect(
        StorageError.fromCode('unauthenticated'),
        StorageError.unauthorized,
      );
      expect(StorageError.fromCode('object-not-found'), StorageError.notFound);
      expect(StorageError.fromCode('canceled'), StorageError.canceled);
      expect(
        StorageError.fromCode('quota-exceeded'),
        StorageError.quotaExceeded,
      );
    });

    test('falls back to unknown', () {
      expect(
        StorageError.fromCode('retry-limit-exceeded'),
        StorageError.unknown,
      );
    });
  });

  group('StorageService validation', () {
    const service = StorageService();

    test('missing file fails with noFile', () async {
      final result = await service.uploadFile(
        root: RootStorageName.scholarship,
        key: 'key',
        file: null,
      );

      expect(result.dataOrNull, isNull);
      expect((result as FirebaseFailure).error, StorageError.noFile);
    });

    test('file over the limit fails with sizeLimit', () async {
      final file = File('${Directory.systemTemp.path}/life_shared_upload.bin')
        ..writeAsBytesSync(List<int>.filled(FileSizes.small.toByte + 1, 0));
      addTearDown(file.deleteSync);

      final result = await service.uploadFile(
        root: RootStorageName.scholarship,
        key: 'key',
        file: file,
        size: FileSizes.small,
      );

      expect((result as FirebaseFailure).error, StorageError.sizeLimit);
    });

    test('empty path list is a success with nothing deleted', () async {
      expect((await service.deleteAssets(paths: null)).dataOrNull, 0);
      expect((await service.deleteAssets(paths: [''])).dataOrNull, 0);
    });
  });
}
