// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppNotificationModel _$AppNotificationModelFromJson(
        Map<String, dynamic> json) =>
    AppNotificationModel(
      body: json['body'] as String?,
      id: json['id'] as String? ?? '',
      title: json['title'] as String?,
      documentId: json['documentId'] as String? ?? '',
      type: $enumDecodeNullable(_$AppNotificationTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$AppNotificationModelToJson(
        AppNotificationModel instance) =>
    <String, dynamic>{
      'body': instance.body,
      'id': instance.id,
      'title': instance.title,
      'type': _$AppNotificationTypeEnumMap[instance.type],
      'documentId': instance.documentId,
    };

const _$AppNotificationTypeEnumMap = {
  AppNotificationType.store: 'store',
  AppNotificationType.campaign: 'campaign',
};
