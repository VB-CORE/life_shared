// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'useful_links_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsefulLinksModel _$UsefulLinksModelFromJson(Map<String, dynamic> json) =>
    UsefulLinksModel(
      title: json['title'] as String?,
      content: json['content'] as String?,
      link: json['link'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] == null
          ? DateTime.now()
          : FirebaseTimeParse.datetimeFromTimestamp(
              json['createdAt'] as Timestamp?),
      updatedAt: json['updatedAt'] == null
          ? DateTime.now()
          : FirebaseTimeParse.datetimeFromTimestamp(
              json['updatedAt'] as Timestamp?),
    );

Map<String, dynamic> _$UsefulLinksModelToJson(UsefulLinksModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'link': instance.link,
      'image': instance.image,
      'createdAt': FirebaseTimeParse.dateTimeToTimestamp(instance.createdAt),
      'updatedAt': FirebaseTimeParse.dateTimeToTimestamp(instance.updatedAt),
    };
