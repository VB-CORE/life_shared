import 'package:cloud_firestore/cloud_firestore.dart';

/// ------------------------------------------------
/// PLEASE DO NOT CHANGE THIS FILE
/// This file is copied from firebase core package
/// @mhmtkrnlk
/// ----

abstract class BaseFirebaseModel<T> extends BaseFirebaseConvert<T> {
  const BaseFirebaseModel();
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
}

abstract class BaseFirebaseConvert<T> {
  const BaseFirebaseConvert();
  T fromFirebase(DocumentSnapshot<Map<String, dynamic>> json);
  String get documentId;
}
