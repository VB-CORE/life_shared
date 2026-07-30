// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'redemption_model.g.dart';

@immutable
@JsonSerializable(includeIfNull: false)
class RedemptionModel extends BaseFirebaseModel<RedemptionModel>
    implements BaseFirebaseConvert<RedemptionModel> {
  const RedemptionModel({
    required this.couponId,
    required this.userUid,
    required this.merchantUid,
    this.status = 'issued',
    this.token,
    this.geoLat,
    this.geoLng,
    this.redeemedAt,
    this.documentId = '',
  });

  factory RedemptionModel.fromJson(Map<String, dynamic> json) =>
      _$RedemptionModelFromJson(json);

  factory RedemptionModel.empty() =>
      const RedemptionModel(couponId: '', userUid: '', merchantUid: '');

  final String couponId;
  final String userUid;
  final String merchantUid;

  final String status;
  final String? token;
  final double? geoLat;
  final double? geoLng;

  @JsonKey(
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
  )
  final DateTime? redeemedAt;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String documentId;

  RedemptionModel copyWith({
    String? couponId,
    String? userUid,
    String? merchantUid,
    String? status,
    String? token,
    double? geoLat,
    double? geoLng,
    DateTime? redeemedAt,
    String? documentId,
  }) {
    return RedemptionModel(
      couponId: couponId ?? this.couponId,
      userUid: userUid ?? this.userUid,
      merchantUid: merchantUid ?? this.merchantUid,
      status: status ?? this.status,
      token: token ?? this.token,
      geoLat: geoLat ?? this.geoLat,
      geoLng: geoLng ?? this.geoLng,
      redeemedAt: redeemedAt ?? this.redeemedAt,
      documentId: documentId ?? this.documentId,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$RedemptionModelToJson(this);

  @override
  RedemptionModel fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    if (data == null) return this;
    return _$RedemptionModelFromJson(data).copyWith(documentId: snapshot.id);
  }

  @override
  RedemptionModel fromJson(Map<String, dynamic> json) =>
      _$RedemptionModelFromJson(json);
}
