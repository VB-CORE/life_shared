import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/src/core/base_firebase_model.dart';
import 'package:life_shared/src/utility/firebase_time_parse.dart';

part 'campaign_model.g.dart';

@JsonSerializable()
final class CampaignModel extends BaseFirebaseModel<CampaignModel>
    with EquatableMixin
    implements BaseFirebaseConvert<CampaignModel> {
  CampaignModel({
    this.name,
    this.topic,
    this.description,
    this.publisher,
    this.startDate,
    this.endDate,
    this.photo,
    this.coverPhoto,
    this.isApproved,
    this.documentId = '',
  });

  final String? name;
  final String? topic;
  final String? description;
  final String? publisher;
  final String? photo;
  final String? coverPhoto;
  final bool? isApproved;

  @JsonKey(
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
    defaultValue: DateTime.now,
  )
  final DateTime? startDate;
  @JsonKey(
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
    defaultValue: DateTime.now,
  )
  final DateTime? endDate;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String documentId;

  @override
  Map<String, dynamic> toJson() => _$CampaignModelToJson(this);

  @override
  List<Object?> get props => [
        name,
        topic,
        description,
        publisher,
        startDate,
        endDate,
        photo,
        coverPhoto,
        isApproved,
      ];

  CampaignModel copyWith({
    String? name,
    String? topic,
    String? description,
    String? publisher,
    DateTime? startDate,
    DateTime? endDate,
    String? photo,
    String? coverPhoto,
    bool? isApproved,
    String? documentId,
  }) {
    return CampaignModel(
      name: name ?? this.name,
      topic: topic ?? this.topic,
      description: description ?? this.description,
      publisher: publisher ?? this.publisher,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      photo: photo ?? this.photo,
      coverPhoto: coverPhoto ?? this.coverPhoto,
      isApproved: isApproved ?? this.isApproved,
      documentId: documentId ?? this.documentId,
    );
  }

  @override
  CampaignModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> json) {
    if (json.data() == null) return this;

    return _$CampaignModelFromJson(json.data()!).copyWith(
      documentId: json.id,
    );
  }

  @override
  CampaignModel fromJson(Map<String, dynamic> json) {
    return _$CampaignModelFromJson(json);
  }
}
