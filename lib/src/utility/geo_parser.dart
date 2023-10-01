import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:life_shared/src/core/constant/package_constants.dart';

@immutable
final class GeoParser {
  const GeoParser._();

  static GeoPoint fromJsonGeoPoint(Map<String, dynamic> geoPoint) {
    final latitude = geoPoint['latitude'] is String ? geoPoint['latitude'] as String : "";
    final longitude = geoPoint['longitude'] is String ? geoPoint['longitude'] as String : "";
    return GeoPoint(
      double.tryParse(latitude) ?? int.tryParse(latitude)?.toDouble() ?? PackageConstants.hatayLatLong.latitude,
      double.tryParse(longitude) ?? int.tryParse(longitude)?.toDouble() ?? PackageConstants.hatayLatLong.longitude,
    );
  }

  static Map<String, dynamic> toJsonGeoPoint(GeoPoint geoPoint) {
    return {'latitude': geoPoint.latitude, 'longitude': geoPoint.longitude};
  }
}
