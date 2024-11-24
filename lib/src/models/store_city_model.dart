import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/src/core/base_firebase_model.dart';
import 'package:life_shared/src/utility/firebase_time_parse.dart';

part 'store_city_model.g.dart';

@JsonSerializable()
final class StoreCityModel extends BaseFirebaseModel<StoreCityModel>
    with EquatableMixin {
  StoreCityModel({
    this.createdAt,
    this.updatedAt,
    this.documentId = '',
    this.name = '',
  });

  final String name;

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
  Map<String, dynamic> toJson() => _$StoreCityModelToJson(this);

  @override
  List<Object?> get props => [
        name,
        createdAt,
        updatedAt,
      ];

  StoreCityModel copyWith({
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? documentId,
  }) {
    return StoreCityModel(
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      documentId: documentId ?? this.documentId,
    );
  }

  @override
  StoreCityModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> json) {
    if (json.data() == null) return this;

    return _$StoreCityModelFromJson(json.data()!).copyWith(
      documentId: json.id,
    );
  }

  @override
  StoreCityModel fromJson(Map<String, dynamic> json) {
    return _$StoreCityModelFromJson(json);
  }
}
