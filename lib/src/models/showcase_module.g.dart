// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'showcase_module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowcaseModule _$ShowcaseModuleFromJson(Map<String, dynamic> json) =>
    ShowcaseModule(
      id: json['id'] as String,
      type: $enumDecode(_$ShowcaseModuleTypeEnumMap, json['type']),
      order: (json['order'] as num).toInt(),
      title: json['title'] as String?,
      body: json['body'] as String?,
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ShowcaseModuleToJson(ShowcaseModule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ShowcaseModuleTypeEnumMap[instance.type]!,
      'order': instance.order,
      'title': ?instance.title,
      'body': ?instance.body,
      'images': instance.images,
    };

const _$ShowcaseModuleTypeEnumMap = {
  ShowcaseModuleType.text: 'text',
  ShowcaseModuleType.image: 'image',
  ShowcaseModuleType.gallery: 'gallery',
  ShowcaseModuleType.hours: 'hours',
  ShowcaseModuleType.contact: 'contact',
  ShowcaseModuleType.map: 'map',
};
