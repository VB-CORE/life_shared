import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'comment_model.g.dart';

/// Reply under `topics/{topicId}/comments/{id}`.
@JsonSerializable(includeIfNull: false)
final class CommentModel extends BaseFirebaseModel<CommentModel>
    with Equatable {
  const CommentModel({
    this.id = '',
    this.author = const AuthorModel.empty(),
    this.content = '',
    this.createdAt,
    this.updatedAt,
    this.isDeleted = false,
  });

  const CommentModel.empty() : this();

  @JsonKey(includeFromJson: false, includeToJson: false)
  final String id;

  final AuthorModel author;
  final String content;

  @JsonKey(
    toJson: FirebaseTimeParse.serverTimestampToJson,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
  )
  final DateTime? createdAt;

  @JsonKey(
    toJson: FirebaseTimeParse.serverTimestampToJson,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
  )
  final DateTime? updatedAt;

  final bool isDeleted;

  @override
  String get documentId => id;

  @override
  Map<String, dynamic> toJson() => _$CommentModelToJson(this);

  @override
  CommentModel fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  @override
  CommentModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data == null) return const CommentModel.empty();
    return fromJson(data).copyWith(id: snapshot.id);
  }

  CommentModel copyWith({
    String? id,
    AuthorModel? author,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
  }) {
    return CommentModel(
      id: id ?? this.id,
      author: author ?? this.author,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object?> get props => [
    id,
    author,
    content,
    createdAt,
    updatedAt,
    isDeleted,
  ];
}
