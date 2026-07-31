// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupMemberModel _$GroupMemberModelFromJson(Map<String, dynamic> json) =>
    GroupMemberModel(
      uid: json['uid'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
      avatarType: (json['avatarType'] as num?)?.toInt() ?? 1,
      role:
          $enumDecodeNullable(
            _$GroupMemberRoleEnumMap,
            json['role'],
            unknownValue: GroupMemberRole.member,
          ) ??
          GroupMemberRole.member,
      createdAt: FirebaseTimeParse.datetimeFromTimestamp(json['createdAt']),
      updatedAt: FirebaseTimeParse.datetimeFromTimestamp(json['updatedAt']),
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$GroupMemberModelToJson(GroupMemberModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
      'avatarType': instance.avatarType,
      'role': _$GroupMemberRoleEnumMap[instance.role]!,
      'createdAt': FirebaseTimeParse.serverTimestampToJson(instance.createdAt),
      'updatedAt': FirebaseTimeParse.serverTimestampToJson(instance.updatedAt),
      'isDeleted': instance.isDeleted,
    };

const _$GroupMemberRoleEnumMap = {
  GroupMemberRole.member: 1,
  GroupMemberRole.admin: 2,
};
