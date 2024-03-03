// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model_snapshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModelSnapshot _$StoreModelSnapshotFromJson(Map<String, dynamic> json) =>
    StoreModelSnapshot(
      name: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      townCode: json['townCode'] as int,
      latlong: json['latlong'] == null
          ? PackageConstants.hatayLatLong
          : GeoParser.fromJsonGeoPoint(json['latlong'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? DateTime.now()
          : FirebaseTimeParse.datetimeFromTimestamp(
              json['createdAt'] as Timestamp?,
            ),
      updatedAt: json['updatedAt'] == null
          ? DateTime.now()
          : FirebaseTimeParse.datetimeFromTimestamp(
              json['updatedAt'] as Timestamp?,
            ),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$StoreModelSnapshotToJson(StoreModelSnapshot instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'townCode': instance.townCode,
      'id': instance.id,
      'images': instance.images,
      'createdAt': FirebaseTimeParse.dateTimeToTimestamp(instance.createdAt),
      'updatedAt': FirebaseTimeParse.dateTimeToTimestamp(instance.updatedAt),
      'latlong': GeoParser.toJsonGeoPoint(instance.latlong),
    };
