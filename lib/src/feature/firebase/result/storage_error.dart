enum StorageError {
  timeout,
  unauthorized,
  notFound,
  canceled,
  quotaExceeded,

  /// File is bigger than the given `FileSizes` limit
  sizeLimit,
  noFile,
  unknown;

  static StorageError fromCode(String code) => switch (code) {
        'unauthorized' || 'unauthenticated' => unauthorized,
        'object-not-found' => notFound,
        'canceled' => canceled,
        'quota-exceeded' => quotaExceeded,
        _ => unknown,
      };
}
