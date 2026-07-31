import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'group_discussion_model.g.dart';

@JsonSerializable(includeIfNull: false)
final class GroupDiscussionModel extends BaseFirebaseModel<GroupDiscussionModel>
    with Equatable {
  const GroupDiscussionModel({
    this.id = '',
    this.title = '',
    this.author = const AuthorModel.empty(),
    this.entryCount = 0,
    this.createdAt,
    this.updatedAt,
    this.isDeleted = false,
  });

  const GroupDiscussionModel.empty() : this();

  factory GroupDiscussionModel.opening({
    required AuthorModel author,
    required String title,
  }) {
    return GroupDiscussionModel(title: title, author: author, entryCount: 1);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  final String id;

  final String title;
  final AuthorModel author;
  final int entryCount;

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
  Map<String, dynamic> toJson() => _$GroupDiscussionModelToJson(this);

  @override
  GroupDiscussionModel fromJson(Map<String, dynamic> json) =>
      _$GroupDiscussionModelFromJson(json);

  @override
  GroupDiscussionModel fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    if (data == null) return const GroupDiscussionModel.empty();
    return fromJson(data).copyWith(id: snapshot.id);
  }

  GroupDiscussionModel copyWith({
    String? id,
    String? title,
    AuthorModel? author,
    int? entryCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
  }) {
    return GroupDiscussionModel(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      entryCount: entryCount ?? this.entryCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    author,
    entryCount,
    createdAt,
    updatedAt,
    isDeleted,
  ];
}
