enum FirestoreError {
  timeout,
  permissionDenied,
  unauthenticated,
  notFound,
  unavailable,
  invalidArgument,

  /// Document exists but could not be mapped to the model
  parse,
  unknown;

  static FirestoreError fromCode(String code) => switch (code) {
        'permission-denied' => permissionDenied,
        'unauthenticated' => unauthenticated,
        'not-found' => notFound,
        'unavailable' || 'deadline-exceeded' || 'aborted' => unavailable,
        'invalid-argument' || 'failed-precondition' => invalidArgument,
        _ => unknown,
      };
}
