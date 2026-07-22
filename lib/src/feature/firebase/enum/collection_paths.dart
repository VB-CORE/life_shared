import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:life_shared/src/feature/firebase/enum/firestore_collection_path.dart';

enum CollectionPaths implements FirestoreCollectionPath {
  towns,
  unApprovedApplications,
  approvedApplications,
  notifications,
  logs,
  adminList,
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
  memories,

  /// v10
  users,
  merchantApplications,
  topics,
  groups,
  coupons,
  allowedAdminClaims,
  ;

  @override
  CollectionReference<Map<String, dynamic>> get collection {
    return FirebaseFirestore.instance.collection(name);
  }

  @override
  String get path => name;
}
