import 'package:cloud_firestore/cloud_firestore.dart';

/// ------------------------------------------------
/// PLEASE DO NOT CHANGE THIS FILE
/// This file is copied from firebase core package
/// @mhmtkrnlk
/// ----

abstract class BaseFirebaseModel<T> extends BaseFirebaseConvert<T> {
  Map<String, dynamic> toJson();
  @override
  String get documentId;
}

abstract class BaseFirebaseConvert<T> {
  T fromFirebase(DocumentSnapshot<Map<String, dynamic>> json);
  String get documentId;
}
