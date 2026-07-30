// ignore_for_file: public_member_api_docs
import 'package:json_annotation/json_annotation.dart';

enum UserRole {
  @JsonValue(1)
  admin(1),
  @JsonValue(2)
  user(2);

  const UserRole(this.value);

  final int value;

  static UserRole fromValue(int? value) => UserRole.values.firstWhere(
        (role) => role.value == value,
        orElse: () => UserRole.user,
      );
}
