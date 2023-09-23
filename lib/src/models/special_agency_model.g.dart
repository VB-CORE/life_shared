// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'special_agency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialAgencyModel _$SpecialAgencyModelFromJson(Map<String, dynamic> json) =>
    SpecialAgencyModel(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['adress'] as String?,
      latLong: json['latlong'] == null
          ? PackageConstants.hatayLatLong
          : GeoParser.fromJsonGeoPoint(json['latlong'] as GeoPoint),
    );

Map<String, dynamic> _$SpecialAgencyModelToJson(SpecialAgencyModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'adress': instance.address,
      'latlong': GeoParser.toJsonGeoPoint(instance.latLong),
    };
