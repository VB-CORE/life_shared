// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:life_shared/life_shared.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends BaseFirebaseConvert<CategoryModel> {
  CategoryModel({
    required this.name,
    required this.value,
    this.documentId = '',
  });

  final String name;
  final int value;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  final String documentId;

  factory CategoryModel.empty() => CategoryModel(
        name: '',
        value: 0,
      );

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  @override
  CategoryModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> json) {
    if (json.data() == null) return CategoryModel.empty();
    return _$CategoryModelFromJson(json.data()!).copyWith(documentId: json.id);
  }

  CategoryModel copyWith({
    String? name,
    int? value,
    String? documentId,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      value: value ?? this.value,
      documentId: documentId ?? this.documentId,
    );
  }
}
