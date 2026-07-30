// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicModel _$TopicModelFromJson(Map<String, dynamic> json) => TopicModel(
  storeId: json['storeId'] as String? ?? '',
  title: json['title'] as String? ?? '',
  author: json['author'] == null
      ? const AuthorModel.empty()
      : AuthorModel.fromJson(json['author'] as Map<String, dynamic>),
  commentCount: (json['commentCount'] as num?)?.toInt() ?? 0,
  lastCommentAt: FirebaseTimeParse.datetimeFromTimestamp(json['lastCommentAt']),
  createdAt: FirebaseTimeParse.datetimeFromTimestamp(json['createdAt']),
  updatedAt: FirebaseTimeParse.datetimeFromTimestamp(json['updatedAt']),
  isDeleted: json['isDeleted'] as bool? ?? false,
);

Map<String, dynamic> _$TopicModelToJson(TopicModel instance) =>
    <String, dynamic>{
      'storeId': instance.storeId,
      'title': instance.title,
      'author': instance.author.toJson(),
      'commentCount': instance.commentCount,
      'lastCommentAt': ?FirebaseTimeParse.dateTimeToTimestamp(
        instance.lastCommentAt,
      ),
      'createdAt': FirebaseTimeParse.serverTimestampToJson(instance.createdAt),
      'updatedAt': FirebaseTimeParse.serverTimestampToJson(instance.updatedAt),
      'isDeleted': instance.isDeleted,
    };
