import 'package:cloud_firestore/cloud_firestore.dart';

/// Implemented by `CollectionPaths` and `SubCollectionPath`, so the service
/// layer works with root and nested collections the same way
abstract interface class FirestoreCollectionPath {
  CollectionReference<Map<String, dynamic>> get collection;

  /// approvedApplications/{placeId}/votes
  String get path;
}
