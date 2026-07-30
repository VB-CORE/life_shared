// ignore_for_file: public_member_api_docs

/// Grants stored on `users/{uid}.permissions` and mirrored into the
/// `permissions` custom claim the security rules read.
enum AppPermission {
  createGroup(1),
  createTopic(2);

  const AppPermission(this.value);

  final int value;

  static AppPermission? fromValue(int value) {
    for (final permission in AppPermission.values) {
      if (permission.value == value) return permission;
    }
    return null;
  }
}
