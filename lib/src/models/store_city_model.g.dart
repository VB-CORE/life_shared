// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreCityModel _$StoreCityModelFromJson(Map<String, dynamic> json) =>
    StoreCityModel(
      createdAt: json['createdAt'] == null
          ? DateTime.now()
          : FirebaseTimeParse.datetimeFromTimestamp(
              json['createdAt'] as Timestamp?),
      updatedAt: json['updatedAt'] == null
          ? DateTime.now()
          : FirebaseTimeParse.datetimeFromTimestamp(
              json['updatedAt'] as Timestamp?),
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$StoreCityModelToJson(StoreCityModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'createdAt': FirebaseTimeParse.dateTimeToTimestamp(instance.createdAt),
      'updatedAt': FirebaseTimeParse.dateTimeToTimestamp(instance.updatedAt),
    };
