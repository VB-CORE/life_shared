import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'scholarship_model.g.dart';

@immutable
@JsonSerializable()
final class ScholarshipModel with EquatableMixin {
  const ScholarshipModel({
    required this.email,
    required this.phoneNumber,
    required this.story,
    required this.studentDocument,
  });

  final String email;
  final String phoneNumber;
  final String story;
  final String studentDocument;

  @override
  List<Object?> get props => [
        email,
        phoneNumber,
        story,
        studentDocument,
      ];

  ScholarshipModel copyWith({
    String? email,
    String? phoneNumber,
    String? story,
    String? studentDocument,
  }) {
    return ScholarshipModel(
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      story: story ?? this.story,
      studentDocument: studentDocument ?? this.studentDocument,
    );
  }
}
