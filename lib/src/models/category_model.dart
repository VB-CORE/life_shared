import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends BaseFirebaseModel<CategoryModel>
    with BaseDropDownModel, Equatable {
  const CategoryModel({
    required this.name,
    required this.value,
    this.documentId = '',
  });

  const CategoryModel.empty() : this(name: '', value: 0);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  final String name;
  final int value;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  final String documentId;

  @override
  CategoryModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> json) {
    if (json.data() == null) return const CategoryModel.empty();
    return _$CategoryModelFromJson(json.data()!).copyWith(documentId: json.id);
  }

  CategoryModel copyWith({String? name, int? value, String? documentId}) {
    return CategoryModel(
      name: name ?? this.name,
      value: value ?? this.value,
      documentId: documentId ?? this.documentId,
    );
  }

  @override
  String get displayName => name;

  @override
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  CategoryModel fromJson(Map<String, dynamic> json) {
    return _$CategoryModelFromJson(json);
  }

  @override
  List<Object?> get props => [name, value];
}
