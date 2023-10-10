import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/src/core/base_firebase_model.dart';
import 'package:life_shared/src/utility/firebase_time_parse.dart';

part 'news_model.g.dart';

@JsonSerializable()
final class NewsModel extends BaseFirebaseModel<NewsModel> with EquatableMixin implements BaseFirebaseConvert<NewsModel> {
  NewsModel({
    this.title,
    this.content,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.documentId = '',
  });

  final String? title;
  final String? content;
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
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String documentId;

  @override
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);

  @override
  List<Object?> get props => [
        title,
        content,
        image,
        createdAt,
        updatedAt,
      ];

  NewsModel copyWith({
    String? title,
    String? content,
    String? image,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? documentId,
  }) {
    return NewsModel(
      title: title ?? this.title,
      content: content ?? this.content,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      documentId: documentId ?? this.documentId,
    );
  }

  @override
  NewsModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> json) {
    if (json.data() == null) return this;

    return _$NewsModelFromJson(json.data()!).copyWith(
      documentId: json.id,
    );
  }

  @override
  NewsModel fromJson(Map<String, dynamic> json) {
    return _$NewsModelFromJson(json);
  }
}
