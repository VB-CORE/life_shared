// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_like_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreLikeModel _$StoreLikeModelFromJson(Map<String, dynamic> json) =>
    StoreLikeModel(
      uid: json['uid'] as String? ?? '',
      createdAt: FirebaseTimeParse.datetimeFromTimestamp(json['createdAt']),
    );

Map<String, dynamic> _$StoreLikeModelToJson(StoreLikeModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'createdAt': FirebaseTimeParse.serverTimestampToJson(instance.createdAt),
    };
