// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignModel _$CampaignModelFromJson(Map<String, dynamic> json) =>
    CampaignModel(
      name: json['name'] as String?,
      topic: json['topic'] as String?,
      description: json['description'] as String?,
      publisher: json['publisher'] as String?,
      startDate: json['startDate'] == null
          ? DateTime.now()
          : FirebaseTimeParse.datetimeFromTimestamp(
              json['startDate'] as Timestamp?,),
      endDate: json['endDate'] == null
          ? DateTime.now()
          : FirebaseTimeParse.datetimeFromTimestamp(
              json['endDate'] as Timestamp?,),
      photo: json['photo'] as String?,
      coverPhoto: json['coverPhoto'] as String?,
      isApproved: json['isApproved'] as bool?,
    );

Map<String, dynamic> _$CampaignModelToJson(CampaignModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'topic': instance.topic,
      'description': instance.description,
      'publisher': instance.publisher,
      'photo': instance.photo,
      'coverPhoto': instance.coverPhoto,
      'isApproved': instance.isApproved,
      'startDate': FirebaseTimeParse.dateTimeToTimestamp(instance.startDate),
      'endDate': FirebaseTimeParse.dateTimeToTimestamp(instance.endDate),
    };
