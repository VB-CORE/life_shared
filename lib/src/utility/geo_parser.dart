import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
final class GeoParser {
  const GeoParser._();

  static GeoPoint fromJsonGeoPoint(GeoPoint geoPoint) {
    return GeoPoint(
      geoPoint.latitude,
      geoPoint.longitude,
    );
  }

  static Map<String, dynamic> toJsonGeoPoint(GeoPoint geoPoint) {
    return {'latitude': geoPoint.latitude, 'longitude': geoPoint.longitude};
  }
}
