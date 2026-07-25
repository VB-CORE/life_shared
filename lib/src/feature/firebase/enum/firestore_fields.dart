/// Audit and soft-delete field names shared by every Firestore document in the
/// project. Query builders and field-level writes read the name from here so a
/// rename stays a single edit.
enum FirestoreFields {
  createdAt,
  updatedAt,
  deletedAt,
  isDeleted,
}
