// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserApplicationModel _$UserApplicationModelFromJson(
  Map<String, dynamic> json,
) => UserApplicationModel(
  id: json['id'] as String? ?? '',
  status: json['status'] == null
      ? UserApplicationStatus.pending
      : UserApplicationStatus.fromValue((json['status'] as num?)?.toInt()),
  deniedMessage: json['deniedMessage'] as String?,
  ownershipDocumentUrl: json['ownershipDocumentUrl'] as String? ?? '',
  createdAt: FirebaseTimeParse.datetimeFromTimestamp(json['createdAt']),
  updatedAt: FirebaseTimeParse.datetimeFromTimestamp(json['updatedAt']),
);

Map<String, dynamic> _$UserApplicationModelToJson(
  UserApplicationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': UserApplicationStatus.toValue(instance.status),
  'deniedMessage': ?instance.deniedMessage,
  'ownershipDocumentUrl': instance.ownershipDocumentUrl,
  'createdAt': ?FirebaseTimeParse.dateTimeToTimestamp(instance.createdAt),
  'updatedAt': ?FirebaseTimeParse.dateTimeToTimestamp(instance.updatedAt),
};
