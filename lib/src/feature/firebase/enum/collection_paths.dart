import 'package:cloud_firestore/cloud_firestore.dart';

enum CollectionPaths {
  towns,
  unApprovedApplications,
  approvedApplications,
  notifications,
  developers,
  specialAgency;

  CollectionReference<Map<String, dynamic>> get collection {
    return FirebaseFirestore.instance.collection(name);
  }
}
