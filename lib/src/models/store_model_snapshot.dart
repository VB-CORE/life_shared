// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kartal/kartal.dart';
import 'package:life_shared/life_shared.dart';
import 'package:life_shared/src/core/constant/package_constants.dart';

part 'store_model_snapshot.g.dart';

@JsonSerializable()
final class StoreModelSnapshot extends BaseFirebaseModel<StoreModelSnapshot>
    with EquatableMixin {
  const StoreModelSnapshot({
    required this.name,
    required this.address,
    required this.phone,
    required this.images,
    required this.townCode,
    this.latlong = PackageConstants.hatayLatLong,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.documentId = '',
  });

  factory StoreModelSnapshot.empty() => StoreModelSnapshot(
        name: '',
        address: '',
        phone: '',
        images: [],
        townCode: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  factory StoreModelSnapshot.fromStoreModel({
    required StoreModel storeModel,
    GeoPoint latlong = PackageConstants.hatayLatLong,
  }) =>
      StoreModelSnapshot(
        id: storeModel.documentId,
        address: storeModel.address ?? '',
        createdAt: storeModel.createdAt,
        updatedAt: storeModel.updatedAt,
        name: storeModel.name.replaceAll('${storeModel.owner} - ', ''),
        phone: storeModel.phone.ext.phoneFormatValue,
        images: storeModel.images,
        townCode: storeModel.townCode,
        latlong: latlong,
      );

  StoreModel toStoreModel({required ChainStoreModel chainStore}) => StoreModel(
        owner: chainStore.name,
        category: chainStore.category,
        description: chainStore.description,
        name: '${chainStore.name} - $name',
        address: address,
        phone: phone.ext.phoneFormatValue,
        images: images,
        townCode: townCode,
        createdAt: createdAt,
        updatedAt: updatedAt,
        isApproved: true,
        documentId: id ?? '',
      );

  final String name;
  final String address;
  final String phone;
  final int townCode;
  final String? id;
  final List<String> images;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  final String documentId;

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

  @JsonKey(
    fromJson: GeoParser.fromJsonGeoPoint,
    toJson: GeoParser.toJsonGeoPoint,
    name: 'latlong',
  )
  final GeoPoint latlong;

  @override
  List<Object?> get props {
    return [
      name,
      address,
      phone,
      id,
      createdAt,
      updatedAt,
      latlong,
    ];
  }

  @override
  StoreModelSnapshot fromFirebase(DocumentSnapshot<Map<String, dynamic>> json) {
    if (json.data() == null) return StoreModelSnapshot.empty();
    return _$StoreModelSnapshotFromJson(json.data()!)
        .copyWith(documentId: json.id);
  }

  @override
  StoreModelSnapshot fromJson(Map<String, dynamic> json) =>
      _$StoreModelSnapshotFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StoreModelSnapshotToJson(this);

  factory StoreModelSnapshot.fromJson(Map<String, dynamic> json) =>
      _$StoreModelSnapshotFromJson(json);

  StoreModelSnapshot copyWith({
    String? name,
    String? address,
    String? phone,
    int? townCode,
    String? id,
    List<String>? images,
    String? documentId,
    DateTime? createdAt,
    DateTime? updatedAt,
    GeoPoint? latlong,
  }) {
    return StoreModelSnapshot(
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      townCode: townCode ?? this.townCode,
      id: id ?? this.id,
      images: images ?? this.images,
      documentId: documentId ?? this.documentId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      latlong: latlong ?? this.latlong,
    );
  }

  @override
  String toString() {
    final name = 'Şube adı: ${this.name}';
    final address = 'Şube adresi: ${this.address}';
    final phone = 'Şube telefon: ${this.phone}';
    return '\n---------------------------------------------------------------\n'
        '$name\n$address\n$phone'
        '\n---------------------------------------------------------------\n';
  }
}
