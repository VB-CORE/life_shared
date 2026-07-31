// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redemption_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedemptionModel _$RedemptionModelFromJson(Map<String, dynamic> json) =>
    RedemptionModel(
      couponId: json['couponId'] as String,
      userUid: json['userUid'] as String,
      merchantUid: json['merchantUid'] as String,
      status: json['status'] as String? ?? 'issued',
      token: json['token'] as String?,
      geoLat: (json['geoLat'] as num?)?.toDouble(),
      geoLng: (json['geoLng'] as num?)?.toDouble(),
      redeemedAt: FirebaseTimeParse.datetimeFromTimestamp(json['redeemedAt']),
    );

Map<String, dynamic> _$RedemptionModelToJson(RedemptionModel instance) =>
    <String, dynamic>{
      'couponId': instance.couponId,
      'userUid': instance.userUid,
      'merchantUid': instance.merchantUid,
      'status': instance.status,
      'token': ?instance.token,
      'geoLat': ?instance.geoLat,
      'geoLng': ?instance.geoLng,
      'redeemedAt': ?FirebaseTimeParse.dateTimeToTimestamp(instance.redeemedAt),
    };
