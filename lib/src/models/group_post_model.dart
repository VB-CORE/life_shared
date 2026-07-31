import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'group_post_model.g.dart';

@JsonSerializable(includeIfNull: false)
final class GroupPostModel extends BaseFirebaseModel<GroupPostModel>
    with Equatable {
  const GroupPostModel({
    this.id = '',
    this.author = const AuthorModel.empty(),
    this.content = '',
    this.imageUrl,
    this.likeCount = 0,
    this.createdAt,
    this.updatedAt,
    this.isDeleted = false,
  });

  const GroupPostModel.empty() : this();

  @JsonKey(includeFromJson: false, includeToJson: false)
  final String id;

  final AuthorModel author;
  final String content;
  final String? imageUrl;
  final int likeCount;

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
  Map<String, dynamic> toJson() => _$GroupPostModelToJson(this);

  @override
  GroupPostModel fromJson(Map<String, dynamic> json) =>
      _$GroupPostModelFromJson(json);

  @override
  GroupPostModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data == null) return const GroupPostModel.empty();
    return fromJson(data).copyWith(id: snapshot.id);
  }

  GroupPostModel copyWith({
    String? id,
    AuthorModel? author,
    String? content,
    String? imageUrl,
    int? likeCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
  }) {
    return GroupPostModel(
      id: id ?? this.id,
      author: author ?? this.author,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      likeCount: likeCount ?? this.likeCount,
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
    imageUrl,
    likeCount,
    createdAt,
    updatedAt,
    isDeleted,
  ];
}
