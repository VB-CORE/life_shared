// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreCityModel _$StoreCityModelFromJson(Map<String, dynamic> json) =>
    StoreCityModel(
      createdAt: json['createdAt'] == null
          ? DateTime.now()
          : FirebaseTimeParse.datetimeFromTimestamp(json['createdAt']),
      updatedAt: json['updatedAt'] == null
          ? DateTime.now()
          : FirebaseTimeParse.datetimeFromTimestamp(json['updatedAt']),
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$StoreCityModelToJson(StoreCityModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'createdAt': FirebaseTimeParse.dateTimeToTimestamp(instance.createdAt),
      'updatedAt': FirebaseTimeParse.dateTimeToTimestamp(instance.updatedAt),
    };
