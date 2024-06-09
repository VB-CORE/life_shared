import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';
import 'package:life_shared/src/core/constant/package_constants.dart';

part 'touristic_places_model.g.dart';

@JsonSerializable()
class TouristicPlaceModel extends BaseFirebaseModel<TouristicPlaceModel>
    with EquatableMixin {
  TouristicPlaceModel({
    this.title,
    this.description,
    this.photo,
    this.latLong = PackageConstants.hatayLatLong,
    this.documentId = '',
  });

  factory TouristicPlaceModel.fromJson(Map<String, dynamic> json) =>
      _$TouristicPlaceModelFromJson(json);

  factory TouristicPlaceModel.empty() => TouristicPlaceModel();

  final String? title;
  final String? description;
  final String? photo;
  @JsonKey(
    fromJson: GeoParser.fromJsonGeoPoint,
    toJson: GeoParser.toJsonGeoPoint,
    name: 'latlong',
  )
  final GeoPoint latLong;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String documentId;

  @override
  TouristicPlaceModel fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> json,
  ) {
    if (json.data() == null) return this;
    return TouristicPlaceModel.fromJson(
      json.data()!.map((key, value) => MapEntry(key.trim(), value)),
    ).copyWith(
      documentId: json.id,
    );
  }

  @override
  TouristicPlaceModel fromJson(Map<String, dynamic> json) =>
      _$TouristicPlaceModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TouristicPlaceModelToJson(this);

  TouristicPlaceModel copyWith({
    String? title,
    String? description,
    String? photo,
    GeoPoint? latLong,
    String? documentId,
  }) {
    return TouristicPlaceModel(
      title: title ?? this.title,
      description: description ?? this.description,
      photo: photo ?? this.photo,
      latLong: latLong ?? this.latLong,
      documentId: documentId ?? this.documentId,
    );
  }

  @override
  List<Object?> get props => [
        title,
        description,
        photo,
        latLong,
        documentId,
      ];
}
