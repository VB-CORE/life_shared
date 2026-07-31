// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
  author: json['author'] == null
      ? const AuthorModel.empty()
      : AuthorModel.fromJson(json['author'] as Map<String, dynamic>),
  content: json['content'] as String? ?? '',
  createdAt: FirebaseTimeParse.datetimeFromTimestamp(json['createdAt']),
  updatedAt: FirebaseTimeParse.datetimeFromTimestamp(json['updatedAt']),
  isDeleted: json['isDeleted'] as bool? ?? false,
);

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'author': instance.author.toJson(),
      'content': instance.content,
      'createdAt': FirebaseTimeParse.serverTimestampToJson(instance.createdAt),
      'updatedAt': FirebaseTimeParse.serverTimestampToJson(instance.updatedAt),
      'isDeleted': instance.isDeleted,
    };
