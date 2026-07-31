import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'merchant_showcase_module_model.g.dart';

/// A storefront card under `approvedApplications/{storeId}/showcase/{id}`.
@JsonSerializable(includeIfNull: false)
final class MerchantShowcaseModuleModel
    extends BaseFirebaseModel<MerchantShowcaseModuleModel>
    with Equatable {
  const MerchantShowcaseModuleModel({
    this.id = '',
    this.type = MerchantShowcaseType.announcement,
    this.title = '',
    this.description = '',
    this.imageUrl,
    this.startAt,
    this.endAt,
    this.isActive = true,
    this.order = 0,
    this.isDeleted = false,
  });

  const MerchantShowcaseModuleModel.empty() : this();

  factory MerchantShowcaseModuleModel.fromJson(Map<String, dynamic> json) =>
      _$MerchantShowcaseModuleModelFromJson(json);

  @JsonKey(includeFromJson: false, includeToJson: false)
  final String id;

  @JsonKey(unknownEnumValue: MerchantShowcaseType.announcement)
  final MerchantShowcaseType type;

  final String title;
  final String description;
  final String? imageUrl;
  final bool isActive;
  final int order;
  final bool isDeleted;

  @JsonKey(
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
  )
  final DateTime? startAt;

  @JsonKey(
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
  )
  final DateTime? endAt;

  /// Live today. An open ended card never expires; a dated one runs through
  /// the whole of its last day.
  bool get isPublished {
    if (!isActive || isDeleted) return false;
    final end = endAt;
    if (end == null) return true;
    final now = DateTime.now();
    return !end.isBefore(DateTime(now.year, now.month, now.day));
  }

  @override
  String get documentId => id;

  @override
  Map<String, dynamic> toJson() => _$MerchantShowcaseModuleModelToJson(this);

  @override
  MerchantShowcaseModuleModel fromJson(Map<String, dynamic> json) =>
      _$MerchantShowcaseModuleModelFromJson(json);

  @override
  MerchantShowcaseModuleModel fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    if (data == null) return const MerchantShowcaseModuleModel.empty();
    return fromJson(data).copyWith(id: snapshot.id);
  }

  MerchantShowcaseModuleModel copyWith({
    String? id,
    MerchantShowcaseType? type,
    String? title,
    String? description,
    String? imageUrl,
    DateTime? startAt,
    DateTime? endAt,
    bool? isActive,
    int? order,
    bool? isDeleted,
    bool clearImageUrl = false,
    bool clearStartAt = false,
    bool clearEndAt = false,
  }) {
    return MerchantShowcaseModuleModel(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: clearImageUrl ? null : imageUrl ?? this.imageUrl,
      startAt: clearStartAt ? null : startAt ?? this.startAt,
      endAt: clearEndAt ? null : endAt ?? this.endAt,
      isActive: isActive ?? this.isActive,
      order: order ?? this.order,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object?> get props => [
    id,
    type,
    title,
    description,
    imageUrl,
    startAt,
    endAt,
    isActive,
    order,
    isDeleted,
  ];
}
