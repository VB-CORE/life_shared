// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'author_model.g.dart';

/// Author snapshot embedded in every piece of user generated content, so a
/// list can be rendered without reading the author's user document.
@JsonSerializable(includeIfNull: false)
final class AuthorModel extends Equatable {
  const AuthorModel({
    this.uid = '',
    this.displayName = '',
    this.avatarType = 1,
    this.role = GroupMemberRole.member,
  });

  const AuthorModel.empty() : this();

  factory AuthorModel.fromMember(GroupMemberModel member) {
    return AuthorModel(
      uid: member.uid,
      displayName: member.displayName,
      avatarType: member.avatarType,
      role: member.role,
    );
  }

  factory AuthorModel.fromUser(UserModel user, {
    GroupMemberRole role = GroupMemberRole.member,
  }) {
    return AuthorModel(
      uid: user.uid,
      displayName: user.displayName,
      avatarType: user.avatarType,
      role: role,
    );
  }

  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorModelFromJson(json);

  final String uid;
  final String displayName;
  final int avatarType;
  @JsonKey(unknownEnumValue: GroupMemberRole.member)
  final GroupMemberRole role;

  bool get isAdmin => role == GroupMemberRole.admin;

  String get maskedDisplayName {
    return displayName
        .trim()
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .map(
          (word) =>
              word.length <= 1 ? word : '${word[0]}${'•' * (word.length - 1)}',
        )
        .join(' ');
  }

  Map<String, dynamic> toJson() => _$AuthorModelToJson(this);

  AuthorModel copyWith({
    String? uid,
    String? displayName,
    int? avatarType,
    GroupMemberRole? role,
  }) {
    return AuthorModel(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      avatarType: avatarType ?? this.avatarType,
      role: role ?? this.role,
    );
  }

  @override
  List<Object?> get props => [uid, displayName, avatarType, role];
}
