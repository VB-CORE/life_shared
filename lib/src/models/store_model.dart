// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kartal/kartal.dart';
import 'package:life_shared/src/core/base_firebase_model.dart';
import 'package:life_shared/src/models/category_model.dart';
import 'package:life_shared/src/utility/index.dart';

part 'store_model.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
final class StoreModel extends BaseFirebaseModel<StoreModel>
    implements BaseFirebaseConvert<StoreModel> {
  const StoreModel({
    required this.name,
    required this.owner,
    required this.address,
    required this.phone,
    required this.images,
    required this.townCode,
    required this.createdAt,
    required this.updatedAt,
    required this.isApproved,
    this.openTime,
    this.closeTime,
    this.visitCount = 0,
    this.deviceID,
    this.description,
    this.documentId = '',
    this.category,
  });

  factory StoreModel.empty() {
    return StoreModel(
      name: '',
      owner: '',
      address: '',
      phone: '',
      images: const [],
      townCode: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isApproved: false,
      deviceID: '',
      description: '',
    );
  }

  final String name;
  final String owner;
  final String? description;
  final String? address;
  final String phone;
  final List<String> images;
  final int townCode;
  final int visitCount;
  final String? openTime;
  final String? closeTime;
  final bool isApproved;
  final String? deviceID;
  final CategoryModel? category;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Returns store open status
  bool get isStoreOpen {
    if (openTime.ext.isNullOrEmpty || closeTime.ext.isNullOrEmpty) {
      return false;
    }

    final splittedOpenTime = openTime?.split(':');
    final splittedCloseTime = closeTime?.split(':');

    if (splittedOpenTime?.length != 2 || splittedCloseTime?.length != 2) {
      return false;
    }

    try {
      final openTime = TimeOfDay(
        hour: int.parse(splittedOpenTime![0]),
        minute: int.parse(splittedOpenTime[1]),
      );

      final closeTime = TimeOfDay(
        hour: int.parse(splittedCloseTime![0]),
        minute: int.parse(splittedCloseTime[1]),
      );

      final currentTimeOfDay = TimeOfDay.now();

      return currentTimeOfDay.isAfter(openTime) &&
          currentTimeOfDay.isBefore(closeTime);
    } catch (e) {
      return false;
    }
  }

  StoreModel copyWith({
    String? name,
    String? owner,
    String? description,
    String? address,
    String? phone,
    List<String>? images,
    int? townCode,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isApproved,
    String? deviceID,
    String? documentId,
    CategoryModel? category,
    int? visitCount,
    String? openTime,
    String? closeTime,
  }) {
    return StoreModel(
      name: name ?? this.name,
      owner: owner ?? this.owner,
      description: description ?? this.description,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      images: images ?? this.images,
      townCode: townCode ?? this.townCode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isApproved: isApproved ?? this.isApproved,
      deviceID: deviceID ?? this.deviceID,
      documentId: documentId ?? this.documentId,
      category: category ?? this.category,
      visitCount: visitCount ?? this.visitCount,
      openTime: openTime ?? this.openTime,
      closeTime: closeTime ?? this.closeTime,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$StoreModelToJson(this);

  @override
  StoreModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data == null) return this;
    return _$StoreModelFromJson(snapshot.data()!).copyWith(
      documentId: snapshot.id,
    );
  }

  @override
  StoreModel fromJson(Map<String, dynamic> json) {
    return _$StoreModelFromJson(json);
  }

  List<Object?> get props {
    return [
      name,
      owner,
      description,
      address,
      townCode,
      documentId,
      createdAt,
      visitCount,
    ];
  }
}
