// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoteModel _$VoteModelFromJson(Map<String, dynamic> json) => VoteModel(
  voterUid: json['voterUid'] as String? ?? '',
  userName: json['userName'] as String? ?? '',
  score: (json['score'] as num?)?.toInt() ?? 0,
  comment: json['comment'] as String?,
  avatarType: (json['avatarType'] as num?)?.toInt() ?? 1,
  createdAt: FirebaseTimeParse.datetimeFromTimestamp(json['createdAt']),
  updatedAt: FirebaseTimeParse.datetimeFromTimestamp(json['updatedAt']),
  isDeleted: json['isDeleted'] as bool? ?? false,
);

Map<String, dynamic> _$VoteModelToJson(VoteModel instance) => <String, dynamic>{
  'voterUid': instance.voterUid,
  'userName': instance.userName,
  'score': instance.score,
  'comment': ?instance.comment,
  'avatarType': instance.avatarType,
  'createdAt': ?FirebaseTimeParse.dateTimeToTimestamp(instance.createdAt),
  'updatedAt': ?FirebaseTimeParse.dateTimeToTimestamp(instance.updatedAt),
  'isDeleted': instance.isDeleted,
};
