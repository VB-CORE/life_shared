import 'package:cloud_firestore/cloud_firestore.dart';

enum CollectionPaths {
  towns,
  unApprovedApplications,
  approvedApplications,
  notifications,
  logs,
  allowedAdminClaims,
  developers,
  categories,
  specialAgency,
  approvedCampaigns,
  unApprovedCampaigns,
  ;

  CollectionReference<Map<String, dynamic>> get collection {
    return FirebaseFirestore.instance.collection(name);
  }
}
