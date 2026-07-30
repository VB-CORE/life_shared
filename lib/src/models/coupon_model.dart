// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'coupon_model.g.dart';

@immutable
@JsonSerializable(includeIfNull: false)
class CouponModel extends BaseFirebaseModel<CouponModel>
    implements BaseFirebaseConvert<CouponModel> {
  const CouponModel({
    required this.storeId,
    required this.merchantUid,
    required this.title,
    required this.ratio,
    this.expiresAt,
    this.status = CouponStatus.active,
    this.redemptionCount = 0,
    this.maxRedemptions,
    this.createdAt,
    this.documentId = '',
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);

  factory CouponModel.empty() =>
      const CouponModel(storeId: '', merchantUid: '', title: '', ratio: 0);

  final String storeId;
  final String merchantUid;
  final String title;

  final int ratio;
  final CouponStatus status;
  final int redemptionCount;
  final int? maxRedemptions;

  @JsonKey(
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
  )
  final DateTime? expiresAt;

  @JsonKey(
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
  )
  final DateTime? createdAt;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String documentId;

  bool get isExpired =>
      expiresAt != null && expiresAt!.isBefore(DateTime.now());

  CouponModel copyWith({
    String? storeId,
    String? merchantUid,
    String? title,
    int? ratio,
    CouponStatus? status,
    int? redemptionCount,
    int? maxRedemptions,
    DateTime? expiresAt,
    DateTime? createdAt,
    String? documentId,
  }) {
    return CouponModel(
      storeId: storeId ?? this.storeId,
      merchantUid: merchantUid ?? this.merchantUid,
      title: title ?? this.title,
      ratio: ratio ?? this.ratio,
      status: status ?? this.status,
      redemptionCount: redemptionCount ?? this.redemptionCount,
      maxRedemptions: maxRedemptions ?? this.maxRedemptions,
      expiresAt: expiresAt ?? this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
      documentId: documentId ?? this.documentId,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$CouponModelToJson(this);

  @override
  CouponModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data == null) return this;
    return _$CouponModelFromJson(data).copyWith(documentId: snapshot.id);
  }

  @override
  CouponModel fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);
}
