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
      expireDate: json['expireDate'] == null
          ? DateTime.now()
          : FirebaseTimeParse.datetimeFromTimestamp(
              json['expireDate'] as Timestamp?),
      photo: json['photo'] as String?,
      coverPhoto: json['coverPhoto'] as String?,
      isApproved: json['isApproved'] as bool?,
      phone: json['phone'] as String?,
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
      'phone': instance.phone,
      'expireDate': FirebaseTimeParse.dateTimeToTimestamp(instance.expireDate),
    };
