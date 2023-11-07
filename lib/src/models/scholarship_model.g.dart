// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scholarship_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScholarshipModel _$ScholarshipModelFromJson(Map<String, dynamic> json) =>
    ScholarshipModel(
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      story: json['story'] as String,
      studentDocument: json['studentDocument'] as String,
      documentFileRef: json['documentFileRef'] as String,
      documentId: json['documentId'] as String? ?? '',
    );

Map<String, dynamic> _$ScholarshipModelToJson(ScholarshipModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'story': instance.story,
      'studentDocument': instance.studentDocument,
      'documentFileRef': instance.documentFileRef,
      'documentId': instance.documentId,
    };
