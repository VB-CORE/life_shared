import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'topic_model.g.dart';

@JsonSerializable(includeIfNull: false)
final class TopicModel extends BaseFirebaseModel<TopicModel> with Equatable {
  const TopicModel({
    this.id = '',
    this.storeId = '',
    this.title = '',
    this.author = const AuthorModel.empty(),
    this.commentCount = 0,
    this.lastCommentAt,
    this.createdAt,
    this.updatedAt,
    this.isDeleted = false,
  });

  const TopicModel.empty() : this();

  @JsonKey(includeFromJson: false, includeToJson: false)
  final String id;

  final String storeId;
  final String title;
  final AuthorModel author;
  final int commentCount;

  @JsonKey(
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
  )
  final DateTime? lastCommentAt;

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
  Map<String, dynamic> toJson() => _$TopicModelToJson(this);

  @override
  TopicModel fromJson(Map<String, dynamic> json) => _$TopicModelFromJson(json);

  @override
  TopicModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data == null) return const TopicModel.empty();
    return fromJson(data).copyWith(id: snapshot.id);
  }

  TopicModel copyWith({
    String? id,
    String? storeId,
    String? title,
    AuthorModel? author,
    int? commentCount,
    DateTime? lastCommentAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
  }) {
    return TopicModel(
      id: id ?? this.id,
      storeId: storeId ?? this.storeId,
      title: title ?? this.title,
      author: author ?? this.author,
      commentCount: commentCount ?? this.commentCount,
      lastCommentAt: lastCommentAt ?? this.lastCommentAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object?> get props => [
    id,
    storeId,
    title,
    author,
    commentCount,
    lastCommentAt,
    createdAt,
    updatedAt,
    isDeleted,
  ];
}
