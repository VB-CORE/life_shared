// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponModel _$CouponModelFromJson(Map<String, dynamic> json) => CouponModel(
  storeId: json['storeId'] as String?,
  merchantUid: json['merchantUid'] as String?,
  desc: json['desc'] as String?,
  ratio: (json['ratio'] as num?)?.toInt(),
  expiresAt: FirebaseTimeParse.datetimeFromTimestamp(json['expiresAt']),
  usageCount: (json['usageCount'] as num?)?.toInt() ?? 0,
  usageLimit: (json['usageLimit'] as num?)?.toInt(),
  createdAt: FirebaseTimeParse.datetimeFromTimestamp(json['createdAt']),
  updatedAt: FirebaseTimeParse.datetimeFromTimestamp(json['updatedAt']),
  isDeleted: json['isDeleted'] as bool? ?? false,
);

Map<String, dynamic> _$CouponModelToJson(CouponModel instance) =>
    <String, dynamic>{
      'storeId': ?instance.storeId,
      'merchantUid': ?instance.merchantUid,
      'desc': ?instance.desc,
      'ratio': ?instance.ratio,
      'usageCount': instance.usageCount,
      'usageLimit': ?instance.usageLimit,
      'expiresAt': ?FirebaseTimeParse.dateTimeToTimestamp(instance.expiresAt),
      'createdAt': ?FirebaseTimeParse.dateTimeToTimestamp(instance.createdAt),
      'updatedAt': ?FirebaseTimeParse.dateTimeToTimestamp(instance.updatedAt),
      'isDeleted': instance.isDeleted,
    };
