// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponModel _$CouponModelFromJson(Map<String, dynamic> json) => CouponModel(
  storeId: json['storeId'] as String,
  merchantUid: json['merchantUid'] as String,
  title: json['title'] as String,
  ratio: (json['ratio'] as num).toInt(),
  expiresAt: FirebaseTimeParse.datetimeFromTimestamp(json['expiresAt']),
  status:
      $enumDecodeNullable(_$CouponStatusEnumMap, json['status']) ??
      CouponStatus.active,
  redemptionCount: (json['redemptionCount'] as num?)?.toInt() ?? 0,
  maxRedemptions: (json['maxRedemptions'] as num?)?.toInt(),
  createdAt: FirebaseTimeParse.datetimeFromTimestamp(json['createdAt']),
);

Map<String, dynamic> _$CouponModelToJson(CouponModel instance) =>
    <String, dynamic>{
      'storeId': instance.storeId,
      'merchantUid': instance.merchantUid,
      'title': instance.title,
      'ratio': instance.ratio,
      'status': _$CouponStatusEnumMap[instance.status]!,
      'redemptionCount': instance.redemptionCount,
      'maxRedemptions': ?instance.maxRedemptions,
      'expiresAt': ?FirebaseTimeParse.dateTimeToTimestamp(instance.expiresAt),
      'createdAt': ?FirebaseTimeParse.dateTimeToTimestamp(instance.createdAt),
    };

const _$CouponStatusEnumMap = {
  CouponStatus.active: 'active',
  CouponStatus.expired: 'expired',
  CouponStatus.disabled: 'disabled',
};
