// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
      name: json['name'] as String,
      owner: json['owner'] as String,
      address: json['address'] as String?,
      phone: json['phone'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      townCode: json['townCode'] as int,
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
      isApproved: json['isApproved'] as bool,
      visitCount: json['visitCount'] as int? ?? 0,
      deviceID: json['deviceID'] as String?,
      description: json['description'] as String?,
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
      'description': instance.description,
      'address': instance.address,
      'phone': instance.phone,
      'images': instance.images,
      'townCode': instance.townCode,
      'visitCount': instance.visitCount,
      'isApproved': instance.isApproved,
      'deviceID': instance.deviceID,
      'category': instance.category?.toJson(),
      'createdAt': FirebaseTimeParse.dateTimeToTimestamp(instance.createdAt),
      'updatedAt': FirebaseTimeParse.dateTimeToTimestamp(instance.updatedAt),
    };
