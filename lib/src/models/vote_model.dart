import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'vote_model.g.dart';

/// One vote under `approvedApplications/{storeId}/votes/{uid}`, keyed by the
/// voter so a user can only rate a place once.
@JsonSerializable(includeIfNull: false)
final class VoteModel extends BaseFirebaseModel<VoteModel> with Equatable {
  const VoteModel({
    this.voterUid = '',
    this.storeId = '',
    this.userName = '',
    this.score = 0,
    this.comment,
    this.merchantReply,
    this.merchantReplyAt,
    this.avatarType = 1,
    this.createdAt,
    this.updatedAt,
    this.isDeleted = false,
  });

  const VoteModel.empty() : this();

  final String voterUid;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final String storeId;

  final String userName;
  final int score;
  final String? comment;

  @JsonKey(includeIfNull: true)
  final String? merchantReply;

  @JsonKey(
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
  )
  final DateTime? merchantReplyAt;

  final int avatarType;

  @JsonKey(
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
  )
  final DateTime? createdAt;

  @JsonKey(
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
  )
  final DateTime? updatedAt;

  final bool isDeleted;

  @override
  String get documentId => voterUid;

  @override
  Map<String, dynamic> toJson() => _$VoteModelToJson(this);

  @override
  VoteModel fromJson(Map<String, dynamic> json) => _$VoteModelFromJson(json);

  @override
  VoteModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data == null) return const VoteModel.empty();
    return fromJson(data).copyWith(
      voterUid: snapshot.id,
      storeId: snapshot.reference.parent.parent?.id ?? '',
    );
  }

  VoteModel copyWith({
    String? voterUid,
    String? storeId,
    String? userName,
    int? score,
    String? comment,
    String? merchantReply,
    DateTime? merchantReplyAt,
    int? avatarType,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
  }) {
    return VoteModel(
      voterUid: voterUid ?? this.voterUid,
      storeId: storeId ?? this.storeId,
      userName: userName ?? this.userName,
      score: score ?? this.score,
      comment: comment ?? this.comment,
      merchantReply: merchantReply ?? this.merchantReply,
      merchantReplyAt: merchantReplyAt ?? this.merchantReplyAt,
      avatarType: avatarType ?? this.avatarType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object?> get props => [
    voterUid,
    storeId,
    userName,
    score,
    comment,
    merchantReply,
    merchantReplyAt,
    avatarType,
    createdAt,
    updatedAt,
    isDeleted,
  ];
}
