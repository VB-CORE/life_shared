// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: json['id'] as String?,
      campaignId: json['campaignId'] as String?,
      newsId: json['newsId'] as String?,
      advertiseId: json['advertiseId'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'campaignId': instance.campaignId,
      'newsId': instance.newsId,
      'advertiseId': instance.advertiseId,
      'link': instance.link,
    };
