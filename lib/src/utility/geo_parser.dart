import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class GeoParser {
  const GeoParser._();

  static GeoPoint fromJsonGeoPoint(GeoPoint geoPoint) {
    return geoPoint;
  }

  static Map<String, dynamic> toJsonGeoPoint(GeoPoint geoPoint) {
    return {'latitude': geoPoint.latitude, 'longitude': geoPoint.longitude};
  }
}
