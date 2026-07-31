import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'user_model.g.dart';

@JsonSerializable(includeIfNull: false)
final class UserModel extends BaseFirebaseModel<UserModel>
    with Equatable, CacheModel {
  const UserModel({
    this.uid = '',
    this.email = '',
    this.displayName = '',
    this.roleType = UserRole.user,
    this.permissions = const [],
    this.avatarType = 1,
    this.photoUrl,
    this.fcmToken,
    this.merchantStoreId,
    this.application,
    this.postCount = 0,
    this.discussionCount = 0,
    this.commentCount = 0,
    this.likeCount = 0,
    this.groupCount = 0,
    this.voteCount = 0,
    this.isBanned = false,
    this.bannedAt,
    this.bannedReason,
    this.bannedBy,
    this.createdAt,
    this.updatedAt,
  });

  const UserModel.empty() : this();

  /// Built from the auth provider on first sign-in. Kept free of a
  /// `firebase_auth` dependency so this package stays platform agnostic.
  factory UserModel.fromAuth({
    required String uid,
    required String email,
    required String displayName,
    required int avatarType,
    String? photoUrl,
  }) {
    return UserModel(
      uid: uid,
      email: email,
      displayName: displayName,
      avatarType: avatarType,
      photoUrl: photoUrl,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  final String uid;
  final String email;
  final String displayName;

  @JsonKey(unknownEnumValue: UserRole.user)
  final UserRole roleType;
  final List<int> permissions;

  final int avatarType;
  final String? photoUrl;
  final String? fcmToken;

  /// Set only by merchant verification; mirrors `approvedApplications/{id}.ownerId`.
  final String? merchantStoreId;
  final UserApplicationModel? application;

  final int postCount;
  final int discussionCount;
  final int commentCount;
  final int likeCount;
  final int groupCount;
  final int voteCount;

  final bool isBanned;
  final String? bannedReason;
  final String? bannedBy;

  @JsonKey(
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
  )
  final DateTime? bannedAt;

  @JsonKey(
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
  )
  final DateTime? createdAt;

  @JsonKey(
    includeToJson: false,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
  )
  final DateTime? updatedAt;

  bool get isAdmin => roleType == UserRole.admin;

  bool get isVerifiedMerchant => merchantStoreId?.isNotEmpty ?? false;

  bool hasPermission(AppPermission permission) =>
      permissions.contains(permission.value);

  bool get canCreateGroup => hasPermission(AppPermission.createGroup);

  bool get canCreateTopic => hasPermission(AppPermission.createTopic);

  @override
  String get documentId => uid;

  @override
  String get id => uid;

  /// Field map for a self-update. Mirrors the whitelist in the security rules.
  static Map<String, Object?> updateFields({
    String? displayName,
    int? avatarType,
    String? fcmToken,
    UserApplicationModel? application,
  }) {
    return {
      'displayName': ?displayName,
      'avatarType': ?avatarType,
      'fcmToken': ?fcmToken,
      'application': ?application?.toJson(),
      FirestoreFields.updatedAt.name: FieldValue.serverTimestamp(),
    };
  }

  /// Single field map for a counter step, kept alone in its write because the
  /// rules allow a counter update to touch nothing else.
  static Map<String, Object?> counterStep(
    UserCounterFields counter, {
    int by = 1,
  }) {
    return {counter.name: FieldValue.increment(by)};
  }

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  UserModel fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  @override
  UserModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data == null) return const UserModel.empty();
    return fromJson(data).copyWith(uid: snapshot.id);
  }

  @override
  UserModel fromDynamicJson(dynamic json) {
    if (json is! Map<String, dynamic>) throw Exception('Invalid json type');
    return fromJson(json);
  }

  UserModel copyWith({
    String? uid,
    String? email,
    String? displayName,
    UserRole? roleType,
    List<int>? permissions,
    int? avatarType,
    String? photoUrl,
    String? fcmToken,
    String? merchantStoreId,
    UserApplicationModel? application,
    int? postCount,
    int? discussionCount,
    int? commentCount,
    int? likeCount,
    int? groupCount,
    int? voteCount,
    bool? isBanned,
    DateTime? bannedAt,
    String? bannedReason,
    String? bannedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      roleType: roleType ?? this.roleType,
      permissions: permissions ?? this.permissions,
      avatarType: avatarType ?? this.avatarType,
      photoUrl: photoUrl ?? this.photoUrl,
      fcmToken: fcmToken ?? this.fcmToken,
      merchantStoreId: merchantStoreId ?? this.merchantStoreId,
      application: application ?? this.application,
      postCount: postCount ?? this.postCount,
      discussionCount: discussionCount ?? this.discussionCount,
      commentCount: commentCount ?? this.commentCount,
      likeCount: likeCount ?? this.likeCount,
      groupCount: groupCount ?? this.groupCount,
      voteCount: voteCount ?? this.voteCount,
      isBanned: isBanned ?? this.isBanned,
      bannedAt: bannedAt ?? this.bannedAt,
      bannedReason: bannedReason ?? this.bannedReason,
      bannedBy: bannedBy ?? this.bannedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    uid,
    email,
    displayName,
    roleType,
    permissions,
    avatarType,
    photoUrl,
    fcmToken,
    merchantStoreId,
    application,
    postCount,
    discussionCount,
    commentCount,
    likeCount,
    groupCount,
    voteCount,
    isBanned,
    bannedAt,
    bannedReason,
    bannedBy,
    createdAt,
    updatedAt,
  ];
}
