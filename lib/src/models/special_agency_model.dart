import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';
import 'package:life_shared/src/core/base_firebase_model.dart';
import 'package:life_shared/src/core/constant/package_constants.dart';

part 'special_agency_model.g.dart';

@JsonSerializable()
final class SpecialAgencyModel extends BaseFirebaseModel<SpecialAgencyModel> with EquatableMixin {
  SpecialAgencyModel({
    this.name,
    this.phone,
    this.address,
    this.latLong = PackageConstants.hatayLatLong,
    this.documentId = '',
  });

  factory SpecialAgencyModel.fromJson(Map<String, dynamic> json) => _$SpecialAgencyModelFromJson(json);

  final String? name;
  final String? phone;
  @JsonKey(name: 'adress')
  final String? address;
  @JsonKey(
    fromJson: GeoParser.fromJsonGeoPoint,
    toJson: GeoParser.toJsonGeoPoint,
    name: 'latlong',
  )
  GeoPoint latLong;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String documentId;

  @override
  Map<String, dynamic> toJson() => _$SpecialAgencyModelToJson(this);

  @override
  List<Object?> get props => [
        name,
        address,
        phone,
        latLong,
        documentId,
      ];

  @override
  SpecialAgencyModel fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> json,
  ) {
    if (json.data() == null) return this;
    return SpecialAgencyModel.fromJson(
      json.data()!.map((key, value) => MapEntry(key.trim(), value)),
    ).copyWith(
      documentId: json.id,
    );
  }

  SpecialAgencyModel copyWith({
    String? name,
    String? phone,
    String? address,
    GeoPoint? latLong,
    String? documentId,
  }) {
    return SpecialAgencyModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      latLong: latLong ?? this.latLong,
      documentId: documentId ?? this.documentId,
    );
  }
}
