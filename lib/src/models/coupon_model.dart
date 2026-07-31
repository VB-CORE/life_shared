// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'coupon_model.g.dart';

/// A merchant's discount coupon under `coupons/{couponId}`. Whether it can
/// still be used is derived from its own fields; there is no status column to
/// drift away from them.
@JsonSerializable(includeIfNull: false)
final class CouponModel extends BaseFirebaseModel<CouponModel>
    with EquatableMixin {
  const CouponModel({
    this.storeId,
    this.merchantUid,
    this.desc,
    this.ratio,
    this.expiresAt,
    this.usageCount = 0,
    this.usageLimit,
    this.createdAt,
    this.updatedAt,
    this.documentId = '',
    this.isDeleted = false,
  });

  const CouponModel.empty() : this();

  factory CouponModel.fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);

  final String? storeId;
  final String? merchantUid;
  final String? desc;
  final int? ratio;
  final int usageCount;
  final int? usageLimit;

  @JsonKey(
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
  )
  final DateTime? expiresAt;

  @JsonKey(
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
  )
  final DateTime? createdAt;

  @JsonKey(
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
  )
  final DateTime? updatedAt;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String documentId;

  final bool isDeleted;

  bool get isExpired =>
      expiresAt != null && expiresAt!.isBefore(DateTime.now());

  bool get isUsageLimitReached {
    final limit = usageLimit;
    if (limit == null) return false;
    return usageCount >= limit;
  }

  bool get isInactive => isDeleted || isExpired || isUsageLimitReached;

  @override
  Map<String, dynamic> toJson() => _$CouponModelToJson(this);

  @override
  CouponModel fromJson(Map<String, dynamic> json) => _$CouponModelFromJson(json);

  @override
  CouponModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data == null) return const CouponModel.empty();
    return fromJson(data).copyWith(documentId: snapshot.id);
  }

  CouponModel copyWith({
    String? storeId,
    String? merchantUid,
    String? desc,
    int? ratio,
    DateTime? expiresAt,
    int? usageCount,
    int? usageLimit,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? documentId,
    bool? isDeleted,
  }) {
    return CouponModel(
      storeId: storeId ?? this.storeId,
      merchantUid: merchantUid ?? this.merchantUid,
      desc: desc ?? this.desc,
      ratio: ratio ?? this.ratio,
      expiresAt: expiresAt ?? this.expiresAt,
      usageCount: usageCount ?? this.usageCount,
      usageLimit: usageLimit ?? this.usageLimit,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      documentId: documentId ?? this.documentId,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object?> get props => [
        storeId,
        merchantUid,
        desc,
        ratio,
        expiresAt,
        usageCount,
        usageLimit,
        createdAt,
        updatedAt,
        documentId,
        isDeleted,
      ];
}
