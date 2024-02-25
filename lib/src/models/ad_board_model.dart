import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'ad_board_model.g.dart';

@immutable
@JsonSerializable()
final class AdBoardModel extends BaseFirebaseModel<AdBoardModel> with EquatableMixin {
  AdBoardModel({
    this.owner,
    this.description,
    this.image,
    this.link,
    this.adIndex,
    this.createdAt,
    this.updatedAt,
    this.documentId = '',
  });

  final String? owner;
  final String? description;
  final String? image;
  final String? link;
  final int? adIndex;

  @JsonKey(
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
    defaultValue: DateTime.now,
  )
  final DateTime? createdAt;
  @JsonKey(
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
    defaultValue: DateTime.now,
  )
  final DateTime? updatedAt;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String documentId;

  @override
  Map<String, dynamic> toJson() => _$AdBoardModelToJson(this);

  @override
  List<Object?> get props => [
        owner,
        description,
        image,
        link,
        adIndex,
        createdAt,
        updatedAt,
      ];

  @override
  AdBoardModel fromJson(Map<String, dynamic> json) => _$AdBoardModelFromJson(json);

  @override
  AdBoardModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> json) {
    if (json.data() == null) return this;

    return _$AdBoardModelFromJson(json.data()!).copyWith(
      documentId: json.id,
    );
  }

  AdBoardModel copyWith({
    String? documentId,
    String? owner,
    String? description,
    String? image,
    String? link,
    int? adIndex,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AdBoardModel(
      documentId: documentId ?? this.documentId,
      owner: owner ?? this.owner,
      description: description ?? this.description,
      image: image ?? this.image,
      link: link ?? this.link,
      adIndex: adIndex ?? this.adIndex,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
