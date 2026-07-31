import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'group_member_model.g.dart';

@JsonSerializable(includeIfNull: false)
final class GroupMemberModel extends BaseFirebaseModel<GroupMemberModel>
    with Equatable {
  const GroupMemberModel({
    this.uid = '',
    this.displayName = '',
    this.avatarType = 1,
    this.role = GroupMemberRole.member,
    this.createdAt,
    this.updatedAt,
    this.isDeleted = false,
  });

  const GroupMemberModel.empty() : this();

  factory GroupMemberModel.fromUser(
    UserModel user, {
    GroupMemberRole role = GroupMemberRole.member,
  }) {
    return GroupMemberModel(
      uid: user.uid,
      displayName: user.displayName,
      avatarType: user.avatarType,
      role: role,
    );
  }

  /// Also the document id. Stored as a field so a collection group query can
  /// find every membership of one user.
  final String uid;

  final String displayName;
  final int avatarType;
  @JsonKey(unknownEnumValue: GroupMemberRole.member)
  final GroupMemberRole role;

  @JsonKey(
    toJson: FirebaseTimeParse.serverTimestampToJson,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
  )
  final DateTime? createdAt;

  @JsonKey(
    toJson: FirebaseTimeParse.serverTimestampToJson,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
  )
  final DateTime? updatedAt;

  final bool isDeleted;

  bool get isAdmin => role == GroupMemberRole.admin;

  @override
  String get documentId => uid;

  @override
  Map<String, dynamic> toJson() => _$GroupMemberModelToJson(this);

  @override
  GroupMemberModel fromJson(Map<String, dynamic> json) =>
      _$GroupMemberModelFromJson(json);

  @override
  GroupMemberModel fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    if (data == null) return const GroupMemberModel.empty();
    return fromJson(data).copyWith(uid: snapshot.id);
  }

  GroupMemberModel copyWith({
    String? uid,
    String? displayName,
    int? avatarType,
    GroupMemberRole? role,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
  }) {
    return GroupMemberModel(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      avatarType: avatarType ?? this.avatarType,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object?> get props => [
    uid,
    displayName,
    avatarType,
    role,
    createdAt,
    updatedAt,
    isDeleted,
  ];
}
