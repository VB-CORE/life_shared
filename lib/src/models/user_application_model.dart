import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'user_application_model.g.dart';

/// Merchant application, embedded in `users/{uid}.application`. [id] points at
/// the `unApprovedApplications` draft the applicant submitted.
@JsonSerializable(includeIfNull: false)
final class UserApplicationModel extends BaseFirebaseModel<UserApplicationModel>
    with Equatable {
  const UserApplicationModel({
    this.id = '',
    this.status = UserApplicationStatus.pending,
    this.deniedMessage,
    this.ownershipDocumentUrl = '',
    this.createdAt,
    this.updatedAt,
  });

  const UserApplicationModel.empty() : this();

  factory UserApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$UserApplicationModelFromJson(json);

  final String id;

  @JsonKey(
    fromJson: UserApplicationStatus.fromValue,
    toJson: UserApplicationStatus.toValue,
  )
  final UserApplicationStatus status;
  final String? deniedMessage;
  final String ownershipDocumentUrl;

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

  bool get isPending => status == UserApplicationStatus.pending;
  bool get isApproved => status == UserApplicationStatus.approved;

  @override
  String get documentId => id;

  @override
  Map<String, dynamic> toJson() => _$UserApplicationModelToJson(this);

  @override
  UserApplicationModel fromJson(Map<String, dynamic> json) =>
      _$UserApplicationModelFromJson(json);

  @override
  UserApplicationModel fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> json,
  ) {
    final data = json.data();
    if (data == null) return const UserApplicationModel.empty();
    return fromJson(data).copyWith(id: json.id);
  }

  UserApplicationModel copyWith({
    String? id,
    UserApplicationStatus? status,
    String? deniedMessage,
    String? ownershipDocumentUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserApplicationModel(
      id: id ?? this.id,
      status: status ?? this.status,
      deniedMessage: deniedMessage ?? this.deniedMessage,
      ownershipDocumentUrl: ownershipDocumentUrl ?? this.ownershipDocumentUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    status,
    deniedMessage,
    ownershipDocumentUrl,
    createdAt,
    updatedAt,
  ];
}
