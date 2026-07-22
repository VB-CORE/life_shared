import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:life_shared/src/feature/firebase/enum/firestore_collection_path.dart';

enum SubCollectionPaths {
  /// v11
  votes,
}

/// Nested collection, example: approvedApplications/{placeId}/votes
@immutable
final class SubCollectionPath extends Equatable
    implements FirestoreCollectionPath {
  const SubCollectionPath({
    required this.parent,
    required this.parentId,
    required this.child,
  });

  final FirestoreCollectionPath parent;
  final String parentId;
  final SubCollectionPaths child;

  @override
  CollectionReference<Map<String, dynamic>> get collection =>
      parent.collection.doc(parentId).collection(child.name);

  @override
  String get path => '${parent.path}/$parentId/${child.name}';

  @override
  List<Object?> get props => [parent, parentId, child];

  @override
  String toString() => 'SubCollectionPath($path)';
}

extension FirestoreCollectionPathX on FirestoreCollectionPath {
  /// CollectionPaths.approvedApplications.sub(placeId, SubCollectionPaths.votes)
  SubCollectionPath sub(String documentId, SubCollectionPaths child) {
    return SubCollectionPath(
      parent: this,
      parentId: documentId,
      child: child,
    );
  }
}
