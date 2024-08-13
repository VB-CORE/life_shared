// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'town_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TownModel _$TownModelFromJson(Map<String, dynamic> json) => TownModel(
      code: (json['code'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TownModelToJson(TownModel instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };
