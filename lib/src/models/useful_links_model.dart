import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';
part 'useful_links_model.g.dart';

@JsonSerializable()
final class UsefulLinksModel extends BaseFirebaseModel<UsefulLinksModel> with EquatableMixin {
  UsefulLinksModel({
    this.documentId = '',
    this.title,
    this.content,
    this.link,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  final String documentId;
  final String? title;
  final String? content;
  final String? link;
  final String? image;
  @JsonKey(
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
    defaultValue: DateTime.now,
  )
  final DateTime? createdAt;
  @JsonKey(
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
    defaultValue: DateTime.now,
  )
  final DateTime? updatedAt;

  @override
  List<Object?> get props => [
        title,
        content,
        link,
        image,
        createdAt,
        updatedAt,
      ];

  UsefulLinksModel copyWith({
    String? title,
    String? content,
    String? link,
    String? image,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? documentId,
  }) {
    return UsefulLinksModel(
      title: title ?? this.title,
      content: content ?? this.content,
      link: link ?? this.link,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      documentId: documentId ?? this.documentId,
    );
  }

  @override
  UsefulLinksModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> json) {
    if (json.data() == null) return this;
    return _$UsefulLinksModelFromJson(json.data()!).copyWith(
      documentId: json.id,
    );
  }

  @override
  UsefulLinksModel fromJson(Map<String, dynamic> json) => _$UsefulLinksModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UsefulLinksModelToJson(this);
}
