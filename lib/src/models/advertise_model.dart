import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'advertise_model.g.dart';

@JsonSerializable()
class AdvertiseModel extends BaseFirebaseModel<AdvertiseModel> {
  AdvertiseModel({
    this.documentId = '',
    this.owner,
    this.phoneNumber,
    this.role,
    this.gender = Genders.other,
    this.title,
    this.description,
  });

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  final String documentId;
  final String? owner;
  final String? phoneNumber;
  final String? role;
  final Genders gender;
  final String? title;
  final String? description;

  @override
  AdvertiseModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> json) {
    final data = json.data();
    if (data == null) {
      throw Exception('Data is null');
    }
    return fromJson(json.data()!).copyWith(documentId: json.id);
  }

  @override
  AdvertiseModel fromJson(Map<String, dynamic> json) =>
      _$AdvertiseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AdvertiseModelToJson(this);

  AdvertiseModel copyWith({
    String? documentId,
    String? owner,
    String? phoneNumber,
    String? role,
    Genders? gender,
    String? title,
    String? description,
  }) {
    return AdvertiseModel(
      gender: gender ?? this.gender,
      documentId: documentId ?? this.documentId,
      owner: owner ?? this.owner,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      role: role ?? this.role,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
