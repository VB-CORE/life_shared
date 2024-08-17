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
      townCode: (json['townCode'] as num?)?.toInt(),
      latLong: json['latlong'] == null
          ? PackageConstants.hatayLatLong
          : GeoParser.fromJsonGeoPoint(json['latlong'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpecialAgencyModelToJson(SpecialAgencyModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'adress': instance.address,
      'townCode': instance.townCode,
      'latlong': GeoParser.toJsonGeoPoint(instance.latLong),
    };
