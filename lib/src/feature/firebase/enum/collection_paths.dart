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
  news,
  scholarship,
  approvedAdvertise,
  unApprovedAdvertise,
  adBoard,
  chainStores,
  touristicPlaces,
  usefulLinks,
  error;

  CollectionReference<Map<String, dynamic>> get collection {
    return FirebaseFirestore.instance.collection(name);
  }
}
