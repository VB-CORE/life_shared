import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

@immutable
final class GeoParser {
  const GeoParser._();

  static GeoPoint fromJsonGeoPoint(Map<String, dynamic> geoPoint) {
    return GeoPoint(
      geoPoint['latitude'] as double,
      geoPoint['longitude'] as double,
    );
  }

  static Map<String, dynamic> toJsonGeoPoint(GeoPoint geoPoint) {
    return {'latitude': geoPoint.latitude, 'longitude': geoPoint.longitude};
  }
}

final class FirebaseGeoParser
    extends JsonConverter<GeoPoint?, Map<String, dynamic>?> {
  const FirebaseGeoParser();
  @override
  GeoPoint? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return GeoPoint(
      json['latitude'] as double,
      json['longitude'] as double,
    );
  }

  @override
  Map<String, dynamic>? toJson(GeoPoint? object) {
    if (object == null) return null;
    return {
      'latitude': object.latitude,
      'longitude': object.longitude,
    };
  }
}
