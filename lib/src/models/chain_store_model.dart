import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'chain_store_model.g.dart';

@JsonSerializable(explicitToJson: true)
final class ChainStoreModel extends BaseFirebaseModel<ChainStoreModel>
    with EquatableMixin {
  const ChainStoreModel({
    required this.name,
    required this.description,
    required this.website,
    required this.logoImageUrl,
    this.openHour,
    this.closeHour,
    this.branches,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.documentId = '',
  });

  factory ChainStoreModel.empty() => ChainStoreModel(
        name: '',
        description: '',
        website: '',
        logoImageUrl: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String documentId;
  final String name;
  final String description;
  final String website;
  final String logoImageUrl;
  final CategoryModel? category;
  final List<StoreModelSnapshot>? branches;

  @JsonKey(
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
    defaultValue: DateTime.now,
  )
  final DateTime? openHour;
  @JsonKey(
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
    defaultValue: DateTime.now,
  )
  final DateTime? closeHour;
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
  List<Object?> get props {
    return [
      documentId,
      name,
      description,
      website,
      logoImageUrl,
      branches,
      category,
      openHour,
      closeHour,
      createdAt,
      updatedAt,
    ];
  }

  ChainStoreModel copyWith({
    String? documentId,
    String? name,
    String? description,
    String? website,
    String? logoImageUrl,
    List<StoreModelSnapshot>? branches,
    CategoryModel? category,
    DateTime? openHour,
    DateTime? closeHour,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ChainStoreModel(
      documentId: documentId ?? this.documentId,
      name: name ?? this.name,
      description: description ?? this.description,
      website: website ?? this.website,
      logoImageUrl: logoImageUrl ?? this.logoImageUrl,
      branches: branches ?? this.branches,
      category: category ?? this.category,
      openHour: openHour ?? this.openHour,
      closeHour: closeHour ?? this.closeHour,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  ChainStoreModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> json) {
    if (json.data() == null) return this;

    return _$ChainStoreModelFromJson(json.data()!).copyWith(
      documentId: json.id,
    );
  }

  @override
  ChainStoreModel fromJson(Map<String, dynamic> json) =>
      _$ChainStoreModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChainStoreModelToJson(this);

  @override
  String toString() {
    final name = 'Zincir market adı: ${this.name}';
    final description = 'Açıklama: ${this.description}';
    final website = 'Website: ${this.website}';
    final category = 'Kategori: ${this.category?.displayName}';
    final openHour =
        'Açılış saati: ${this.openHour?.hour} : ${this.openHour?.minute}';
    final closeHour =
        'Kapanış saati: ${this.closeHour?.hour} : ${this.closeHour?.minute}';
    final branches = 'Şubeler:\n ${this.branches}';

    return '$name\n$description\n$website\n$category\n$openHour\n$closeHour\n$branches';
  }
}
