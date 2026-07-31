// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_like_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostLikeModel _$PostLikeModelFromJson(Map<String, dynamic> json) =>
    PostLikeModel(
      uid: json['uid'] as String? ?? '',
      createdAt: FirebaseTimeParse.datetimeFromTimestamp(json['createdAt']),
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$PostLikeModelToJson(PostLikeModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'createdAt': FirebaseTimeParse.serverTimestampToJson(instance.createdAt),
      'isDeleted': instance.isDeleted,
    };
