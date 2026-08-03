import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'store_like_model.g.dart';

@JsonSerializable(includeIfNull: false)
final class StoreLikeModel extends BaseFirebaseModel<StoreLikeModel>
    with Equatable {
  const StoreLikeModel({
    this.uid = '',
    this.storeId = '',
    this.createdAt,
  });

  const StoreLikeModel.empty() : this();

  final String uid;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final String storeId;

  @JsonKey(
    toJson: FirebaseTimeParse.serverTimestampToJson,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
  )
  final DateTime? createdAt;

  @override
  String get documentId => uid;

  @override
  Map<String, dynamic> toJson() => _$StoreLikeModelToJson(this);

  @override
  StoreLikeModel fromJson(Map<String, dynamic> json) =>
      _$StoreLikeModelFromJson(json);

  @override
  StoreLikeModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data == null) return const StoreLikeModel.empty();
    return fromJson(data).copyWith(
      uid: snapshot.id,
      storeId: snapshot.reference.parent.parent?.id ?? '',
    );
  }

  StoreLikeModel copyWith({
    String? uid,
    String? storeId,
    DateTime? createdAt,
  }) {
    return StoreLikeModel(
      uid: uid ?? this.uid,
      storeId: storeId ?? this.storeId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [uid, storeId, createdAt];
}
