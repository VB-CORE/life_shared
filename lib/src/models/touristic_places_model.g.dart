// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'touristic_places_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TouristicPlaceModel _$TouristicPlaceModelFromJson(Map<String, dynamic> json) =>
    TouristicPlaceModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      photo: json['photo'] as String?,
      latLong: json['latlong'] == null
          ? PackageConstants.hatayLatLong
          : GeoParser.fromJsonGeoPoint(json['latlong'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TouristicPlaceModelToJson(
        TouristicPlaceModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'photo': instance.photo,
      'latlong': GeoParser.toJsonGeoPoint(instance.latLong),
    };
