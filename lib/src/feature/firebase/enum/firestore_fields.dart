/// Audit and soft-delete field names shared by every Firestore document, so a
/// query builder and a field-level write cannot spell them differently.
enum FirestoreFields {
  createdAt,
  updatedAt,
  deletedAt,
  isDeleted,
}
