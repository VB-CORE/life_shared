// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_board_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdBoardModel _$AdBoardModelFromJson(Map<String, dynamic> json) => AdBoardModel(
      owner: json['owner'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      link: json['link'] as String?,
      adIndex: json['adIndex'] as int?,
      createdAt: json['createdAt'] == null
          ? DateTime.now()
          : FirebaseTimeParse.datetimeFromTimestamp(
              json['createdAt'] as Timestamp?),
      updatedAt: json['updatedAt'] == null
          ? DateTime.now()
          : FirebaseTimeParse.datetimeFromTimestamp(
              json['updatedAt'] as Timestamp?),
    );

Map<String, dynamic> _$AdBoardModelToJson(AdBoardModel instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'description': instance.description,
      'image': instance.image,
      'link': instance.link,
      'adIndex': instance.adIndex,
      'createdAt': FirebaseTimeParse.dateTimeToTimestamp(instance.createdAt),
      'updatedAt': FirebaseTimeParse.dateTimeToTimestamp(instance.updatedAt),
    };
