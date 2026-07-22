import 'package:life_shared/src/feature/firebase/result/firestore_error.dart';
import 'package:life_shared/src/feature/firebase/result/storage_error.dart';

/// Result of a Firebase call. [E] is the error vocabulary of the service that
/// produced it, so `switch` on a failure stays exhaustive.
sealed class FirebaseResult<T, E> {
  const FirebaseResult();

  T? get dataOrNull => switch (this) {
        FirebaseSuccess<T, E>(:final data) => data,
        FirebaseFailure<T, E>() => null,
      };

  bool get isSuccess => this is FirebaseSuccess<T, E>;
}

final class FirebaseSuccess<T, E> extends FirebaseResult<T, E> {
  const FirebaseSuccess(this.data);

  final T data;
}

final class FirebaseFailure<T, E> extends FirebaseResult<T, E> {
  const FirebaseFailure(this.error, {this.message});

  final E error;

  /// Raw message coming from Firebase, for logging and debugging
  final String? message;
}

typedef FirestoreResult<T> = FirebaseResult<T, FirestoreError>;

typedef StorageResult<T> = FirebaseResult<T, StorageError>;
