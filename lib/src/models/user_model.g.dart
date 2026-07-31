// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  uid: json['uid'] as String? ?? '',
  email: json['email'] as String? ?? '',
  displayName: json['displayName'] as String? ?? '',
  roleType:
      $enumDecodeNullable(
        _$UserRoleEnumMap,
        json['roleType'],
        unknownValue: UserRole.user,
      ) ??
      UserRole.user,
  permissions:
      (json['permissions'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  avatarType: (json['avatarType'] as num?)?.toInt() ?? 1,
  photoUrl: json['photoUrl'] as String?,
  fcmToken: json['fcmToken'] as String?,
  merchantStoreId: json['merchantStoreId'] as String?,
  application: json['application'] == null
      ? null
      : UserApplicationModel.fromJson(
          json['application'] as Map<String, dynamic>,
        ),
  postCount: (json['postCount'] as num?)?.toInt() ?? 0,
  discussionCount: (json['discussionCount'] as num?)?.toInt() ?? 0,
  commentCount: (json['commentCount'] as num?)?.toInt() ?? 0,
  likeCount: (json['likeCount'] as num?)?.toInt() ?? 0,
  groupCount: (json['groupCount'] as num?)?.toInt() ?? 0,
  voteCount: (json['voteCount'] as num?)?.toInt() ?? 0,
  isBanned: json['isBanned'] as bool? ?? false,
  bannedAt: FirebaseTimeParse.datetimeFromTimestamp(json['bannedAt']),
  bannedReason: json['bannedReason'] as String?,
  bannedBy: json['bannedBy'] as String?,
  createdAt: FirebaseTimeParse.datetimeFromTimestamp(json['createdAt']),
  updatedAt: FirebaseTimeParse.datetimeFromTimestamp(json['updatedAt']),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'uid': instance.uid,
  'email': instance.email,
  'displayName': instance.displayName,
  'roleType': _$UserRoleEnumMap[instance.roleType]!,
  'permissions': instance.permissions,
  'avatarType': instance.avatarType,
  'photoUrl': ?instance.photoUrl,
  'fcmToken': ?instance.fcmToken,
  'merchantStoreId': ?instance.merchantStoreId,
  'application': ?instance.application?.toJson(),
  'postCount': instance.postCount,
  'discussionCount': instance.discussionCount,
  'commentCount': instance.commentCount,
  'likeCount': instance.likeCount,
  'groupCount': instance.groupCount,
  'voteCount': instance.voteCount,
  'isBanned': instance.isBanned,
  'bannedReason': ?instance.bannedReason,
  'bannedBy': ?instance.bannedBy,
  'bannedAt': ?FirebaseTimeParse.dateTimeToTimestamp(instance.bannedAt),
  'createdAt': ?FirebaseTimeParse.dateTimeToTimestamp(instance.createdAt),
};

const _$UserRoleEnumMap = {UserRole.admin: 1, UserRole.user: 2};
