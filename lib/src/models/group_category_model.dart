// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:life_shared/life_shared.dart';
part 'group_category_model.g.dart';

@JsonSerializable()
class GroupCategoryModel extends BaseFirebaseModel<GroupCategoryModel>
    with BaseDropDownModel, EquatableMixin {
  const GroupCategoryModel({
    required this.name,
    required this.value,
    this.documentId = '',
  });

  final String name;
  final int value;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  final String documentId;

  const GroupCategoryModel.empty() : this(name: '', value: 0);

  factory GroupCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$GroupCategoryModelFromJson(json);

  @override
  GroupCategoryModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> json) {
    if (json.data() == null) return const GroupCategoryModel.empty();
    return _$GroupCategoryModelFromJson(json.data()!)
        .copyWith(documentId: json.id);
  }

  GroupCategoryModel copyWith({
    String? name,
    int? value,
    String? documentId,
  }) {
    return GroupCategoryModel(
      name: name ?? this.name,
      value: value ?? this.value,
      documentId: documentId ?? this.documentId,
    );
  }

  @override
  String get displayName => name;

  @override
  Map<String, dynamic> toJson() => _$GroupCategoryModelToJson(this);

  @override
  GroupCategoryModel fromJson(Map<String, dynamic> json) {
    return _$GroupCategoryModelFromJson(json);
  }

  @override
  List<Object?> get props => [name, value];
}
