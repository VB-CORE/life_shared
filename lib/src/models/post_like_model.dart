// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'post_like_model.g.dart';

/// One like under `groups/{groupId}/posts/{postId}/likes/{uid}`. It carries no
/// copy of the post: the parent path already says which post, so there is
/// nothing to keep in sync and nothing left behind when the post is retired.
@JsonSerializable(includeIfNull: false)
final class PostLikeModel extends BaseFirebaseModel<PostLikeModel>
    with EquatableMixin {
  const PostLikeModel({
    this.uid = '',
    this.createdAt,
    this.isDeleted = false,
  });

  const PostLikeModel.empty() : this();

  /// Also the document id, so a user can like a post once.
  final String uid;

  @JsonKey(
    toJson: FirebaseTimeParse.serverTimestampToJson,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
  )
  final DateTime? createdAt;

  final bool isDeleted;

  @override
  String get documentId => uid;

  @override
  Map<String, dynamic> toJson() => _$PostLikeModelToJson(this);

  @override
  PostLikeModel fromJson(Map<String, dynamic> json) =>
      _$PostLikeModelFromJson(json);

  @override
  PostLikeModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data == null) return const PostLikeModel.empty();
    return fromJson(data).copyWith(uid: snapshot.id);
  }

  PostLikeModel copyWith({String? uid, DateTime? createdAt, bool? isDeleted}) {
    return PostLikeModel(
      uid: uid ?? this.uid,
      createdAt: createdAt ?? this.createdAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object?> get props => [uid, createdAt, isDeleted];
}
