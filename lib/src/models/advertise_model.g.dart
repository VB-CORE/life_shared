// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvertiseModel _$AdvertiseModelFromJson(Map<String, dynamic> json) =>
    AdvertiseModel(
      documentId: json['documentId'] as String? ?? '',
      owner: json['owner'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      role: json['role'] as String?,
      gender: $enumDecodeNullable(_$GendersEnumMap, json['gender']) ??
          Genders.other,
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AdvertiseModelToJson(AdvertiseModel instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'owner': instance.owner,
      'phoneNumber': instance.phoneNumber,
      'role': instance.role,
      'gender': _$GendersEnumMap[instance.gender]!,
      'title': instance.title,
      'description': instance.description,
    };

const _$GendersEnumMap = {
  Genders.male: 'Erkek',
  Genders.female: 'Kadın',
  Genders.other: 'Diğer',
};
