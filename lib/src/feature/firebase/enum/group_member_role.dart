import 'package:json_annotation/json_annotation.dart';

enum GroupMemberRole {
  @JsonValue(1)
  member(1),
  @JsonValue(2)
  admin(2);

  const GroupMemberRole(this.value);

  final int value;

  static GroupMemberRole fromValue(int? value) =>
      GroupMemberRole.values.firstWhere(
        (role) => role.value == value,
        orElse: () => GroupMemberRole.member,
      );
}
