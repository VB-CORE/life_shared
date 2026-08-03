// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppNotificationModel _$AppNotificationModelFromJson(
  Map<String, dynamic> json,
) => AppNotificationModel(
  createdAt: json['createdAt'] == null
      ? DateTime.now()
      : FirebaseTimeParse.datetimeFromTimestamp(json['createdAt']),
  body: json['body'] as String?,
  id: json['id'] as String? ?? '',
  title: json['title'] as String?,
  documentId: json['documentId'] as String? ?? '',
  type: $enumDecodeNullable(_$AppNotificationTypeEnumMap, json['type']),
  read: json['read'] as bool? ?? false,
  targetId: json['targetId'] as String?,
);

Map<String, dynamic> _$AppNotificationModelToJson(
  AppNotificationModel instance,
) => <String, dynamic>{
  'body': instance.body,
  'id': instance.id,
  'title': instance.title,
  'type': _$AppNotificationTypeEnumMap[instance.type],
  'read': instance.read,
  'targetId': instance.targetId,
  'createdAt': FirebaseTimeParse.dateTimeToTimestamp(instance.createdAt),
  'documentId': instance.documentId,
};

const _$AppNotificationTypeEnumMap = {
  AppNotificationType.place: 'place',
  AppNotificationType.event: 'event',
  AppNotificationType.memory: 'memory',
  AppNotificationType.system: 'system',
};
