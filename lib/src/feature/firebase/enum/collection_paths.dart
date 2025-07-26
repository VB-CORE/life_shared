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
  approvedStoreCities,
  error,

  /// v8
  regionalCities,
  regionalTowns,

  /// v9
  memories;

  CollectionReference<Map<String, dynamic>> get collection {
    return FirebaseFirestore.instance.collection(name);
  }
}
