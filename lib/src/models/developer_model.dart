import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/src/core/base_firebase_model.dart';
part 'developer_model.g.dart';

@JsonSerializable()
final class DeveloperModel extends BaseFirebaseConvert<DeveloperModel>
    with EquatableMixin {
  DeveloperModel({
    this.name,
    this.githubUrl,
    this.image,
    this.documentId = '',
  });

  factory DeveloperModel.fromJson(Map<String, dynamic> json) =>
      _$DeveloperModelFromJson(json);

  final String? name;
  @JsonKey(name: 'github_url')
  final String? githubUrl;
  final String? image;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String documentId;

  @override
  List<Object?> get props => [name, githubUrl, image, documentId];

  @override
  DeveloperModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> json) {
    if (json.data() == null) return this;
    return _$DeveloperModelFromJson(json.data()!).copyWith(
      documentId: json.id,
    );
  }

  DeveloperModel copyWith({
    String? documentId,
    String? name,
    String? githubUrl,
    String? image,
  }) {
    return DeveloperModel(
      documentId: documentId ?? this.documentId,
      name: name ?? this.name,
      githubUrl: githubUrl ?? this.githubUrl,
      image: image ?? this.image,
    );
  }
}
