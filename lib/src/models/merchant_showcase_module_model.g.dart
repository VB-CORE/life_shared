// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_showcase_module_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantShowcaseModuleModel _$MerchantShowcaseModuleModelFromJson(
  Map<String, dynamic> json,
) => MerchantShowcaseModuleModel(
  type:
      $enumDecodeNullable(
        _$MerchantShowcaseTypeEnumMap,
        json['type'],
        unknownValue: MerchantShowcaseType.announcement,
      ) ??
      MerchantShowcaseType.announcement,
  title: json['title'] as String? ?? '',
  description: json['description'] as String? ?? '',
  imageUrl: json['imageUrl'] as String?,
  startAt: FirebaseTimeParse.datetimeFromTimestamp(json['startAt']),
  endAt: FirebaseTimeParse.datetimeFromTimestamp(json['endAt']),
  isActive: json['isActive'] as bool? ?? true,
  order: (json['order'] as num?)?.toInt() ?? 0,
  isDeleted: json['isDeleted'] as bool? ?? false,
);

Map<String, dynamic> _$MerchantShowcaseModuleModelToJson(
  MerchantShowcaseModuleModel instance,
) => <String, dynamic>{
  'type': _$MerchantShowcaseTypeEnumMap[instance.type]!,
  'title': instance.title,
  'description': instance.description,
  'imageUrl': ?instance.imageUrl,
  'isActive': instance.isActive,
  'order': instance.order,
  'isDeleted': instance.isDeleted,
  'startAt': ?FirebaseTimeParse.dateTimeToTimestamp(instance.startAt),
  'endAt': ?FirebaseTimeParse.dateTimeToTimestamp(instance.endAt),
};

const _$MerchantShowcaseTypeEnumMap = {
  MerchantShowcaseType.announcement: 1,
  MerchantShowcaseType.campaign: 2,
  MerchantShowcaseType.product: 3,
  MerchantShowcaseType.gallery: 4,
};
