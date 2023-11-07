import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/src/core/base_firebase_model.dart';

part 'scholarship_model.g.dart';

@immutable
@JsonSerializable()
final class ScholarshipModel extends BaseFirebaseModel<ScholarshipModel>
    with EquatableMixin {
  const ScholarshipModel({
    required this.email,
    required this.phoneNumber,
    required this.story,
    required this.studentDocument,
    required this.documentFileRef,
    this.documentId = '',
  });

  factory ScholarshipModel.fromJson(Map<String, dynamic> json) =>
      _$ScholarshipModelFromJson(json);

  factory ScholarshipModel.empty() {
    return const ScholarshipModel(
      email: '',
      phoneNumber: '',
      story: '',
      studentDocument: '',
      documentFileRef: '',
    );
  }

  final String email;
  final String phoneNumber;
  final String story;
  final String studentDocument;
  final String documentFileRef;

  @override
  List<Object?> get props => [
        email,
        phoneNumber,
        story,
        studentDocument,
        documentFileRef,
      ];

  ScholarshipModel copyWith({
    String? email,
    String? phoneNumber,
    String? story,
    String? studentDocument,
    String? documentId,
    String? documentFileRef,
  }) {
    return ScholarshipModel(
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      story: story ?? this.story,
      studentDocument: studentDocument ?? this.studentDocument,
      documentId: documentId ?? this.documentId,
      documentFileRef: documentFileRef ?? this.documentFileRef,
    );
  }

  @override
  final String documentId;

  @override
  ScholarshipModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> json) {
    if (json.data() == null) return this;

    return ScholarshipModel.fromJson(json.data()!).copyWith(
      documentId: json.id,
    );
  }

  @override
  ScholarshipModel fromJson(Map<String, dynamic> json) =>
      _$ScholarshipModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ScholarshipModelToJson(this);
}
