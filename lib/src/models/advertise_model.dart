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
    if (json.data() == null) {
      throw Exception('Data is null');
    }
    return fromJson(json.data()!);
  }

  @override
  AdvertiseModel fromJson(Map<String, dynamic> json) =>
      _$AdvertiseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AdvertiseModelToJson(this);
}
