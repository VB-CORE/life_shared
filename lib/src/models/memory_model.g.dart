// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemoryModel _$MemoryModelFromJson(Map<String, dynamic> json) => MemoryModel(
      documentId: json['documentId'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: FirebaseTimeParse.datetimeFromTimestamp(
          json['createdAt'] as Timestamp?),
      updatedAt: FirebaseTimeParse.datetimeFromTimestamp(
          json['updatedAt'] as Timestamp?),
    );

Map<String, dynamic> _$MemoryModelToJson(MemoryModel instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'title': instance.title,
      'description': instance.description,
      'imageUrls': instance.imageUrls,
      'createdAt': FirebaseTimeParse.dateTimeToTimestamp(instance.createdAt),
      'updatedAt': FirebaseTimeParse.dateTimeToTimestamp(instance.updatedAt),
    };
