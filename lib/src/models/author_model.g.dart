// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorModel _$AuthorModelFromJson(Map<String, dynamic> json) => AuthorModel(
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
);

Map<String, dynamic> _$AuthorModelToJson(AuthorModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
      'avatarType': instance.avatarType,
      'role': _$GroupMemberRoleEnumMap[instance.role]!,
    };

const _$GroupMemberRoleEnumMap = {
  GroupMemberRole.member: 1,
  GroupMemberRole.admin: 2,
};
