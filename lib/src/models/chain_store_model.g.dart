// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chain_store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChainStoreModel _$ChainStoreModelFromJson(Map<String, dynamic> json) =>
    ChainStoreModel(
      name: json['name'] as String,
      description: json['description'] as String,
      website: json['website'] as String,
      logoImageUrl: json['logoImageUrl'] as String,
      openHour: json['openHour'] == null
          ? DateTime.now()
          : FirebaseTimeParse.datetimeFromTimestamp(
              json['openHour'] as Timestamp?,
            ),
      closeHour: json['closeHour'] == null
          ? DateTime.now()
          : FirebaseTimeParse.datetimeFromTimestamp(
              json['closeHour'] as Timestamp?,
            ),
      branches: (json['branches'] as List<dynamic>?)
          ?.map((e) => StoreModelSnapshot.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChainStoreModelToJson(ChainStoreModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'website': instance.website,
      'logoImageUrl': instance.logoImageUrl,
      'category': instance.category?.toJson(),
      'branches': instance.branches?.map((e) => e.toJson()).toList(),
      'openHour': FirebaseTimeParse.dateTimeToTimestamp(instance.openHour),
      'closeHour': FirebaseTimeParse.dateTimeToTimestamp(instance.closeHour),
      'createdAt': FirebaseTimeParse.dateTimeToTimestamp(instance.createdAt),
      'updatedAt': FirebaseTimeParse.dateTimeToTimestamp(instance.updatedAt),
    };
