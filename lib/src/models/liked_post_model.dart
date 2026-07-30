// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'liked_post_model.g.dart';

/// Snapshot of a liked post under `users/{uid}/likedPosts/{postId}`, so the
/// list renders without reading each source post.
@JsonSerializable(includeIfNull: false)
final class LikedPostModel extends BaseFirebaseModel<LikedPostModel>
    with EquatableMixin {
  const LikedPostModel({
    this.postId = '',
    this.groupId = '',
    this.groupName = '',
    this.author = const AuthorModel.empty(),
    this.content = '',
    this.imageUrl,
    this.likedAt,
    this.isDeleted = false,
  });

  const LikedPostModel.empty() : this();

  factory LikedPostModel.fromPost({
    required GroupPostModel post,
    required String groupId,
    required String groupName,
  }) {
    return LikedPostModel(
      postId: post.id,
      groupId: groupId,
      groupName: groupName,
      author: post.author,
      content: post.content,
      imageUrl: post.imageUrl,
    );
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  final String postId;

  final String groupId;
  final String groupName;
  final AuthorModel author;
  final String content;
  final String? imageUrl;

  @JsonKey(
    toJson: FirebaseTimeParse.serverTimestampToJson,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
  )
  final DateTime? likedAt;

  final bool isDeleted;

  @override
  String get documentId => postId;

  @override
  Map<String, dynamic> toJson() => _$LikedPostModelToJson(this);

  @override
  LikedPostModel fromJson(Map<String, dynamic> json) =>
      _$LikedPostModelFromJson(json);

  @override
  LikedPostModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data == null) return const LikedPostModel.empty();
    return fromJson(data).copyWith(postId: snapshot.id);
  }

  LikedPostModel copyWith({
    String? postId,
    String? groupId,
    String? groupName,
    AuthorModel? author,
    String? content,
    String? imageUrl,
    DateTime? likedAt,
    bool? isDeleted,
  }) {
    return LikedPostModel(
      postId: postId ?? this.postId,
      groupId: groupId ?? this.groupId,
      groupName: groupName ?? this.groupName,
      author: author ?? this.author,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      likedAt: likedAt ?? this.likedAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object?> get props => [
        postId,
        groupId,
        groupName,
        author,
        content,
        imageUrl,
        likedAt,
        isDeleted,
      ];
}
