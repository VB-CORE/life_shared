import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'town_model.g.dart';

@JsonSerializable()
final class TownModel extends BaseFirebaseConvert<TownModel>
    with EquatableMixin, BaseDropDownModel {
  TownModel({
    this.code,
    this.name,
    this.documentId = '',
  });

  factory TownModel.fromJson(Map<String, dynamic> json) =>
      _$TownModelFromJson(json);

  final int? code;
  final String? name;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String documentId;

  Map<String, dynamic> toJson() => _$TownModelToJson(this);

  TownModel fromJson(Map<String, dynamic> json) => _$TownModelFromJson(json);

  @override
  List<Object?> get props => [code, name, documentId];

  @override
  TownModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> json) {
    if (json.data() == null) return this;
    return _$TownModelFromJson(json.data()!).copyWith(
      documentId: json.id,
    );
  }

  TownModel copyWith({
    int? code,
    String? name,
    String? documentId,
  }) {
    return TownModel(
      code: code ?? this.code,
      name: name ?? this.name,
      documentId: documentId ?? this.documentId,
    );
  }

  @override
  String get displayName => name ?? '';
}
