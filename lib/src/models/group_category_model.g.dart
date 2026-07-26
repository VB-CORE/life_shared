// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupCategoryModel _$GroupCategoryModelFromJson(Map<String, dynamic> json) =>
    GroupCategoryModel(
      name: json['name'] as String,
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$GroupCategoryModelToJson(GroupCategoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
