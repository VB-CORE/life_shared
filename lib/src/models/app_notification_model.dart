import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/src/core/base_firebase_model.dart';

part 'app_notification_model.g.dart';

@JsonSerializable()
final class AppNotificationModel
    extends BaseFirebaseConvert<AppNotificationModel> with EquatableMixin {
  AppNotificationModel({
    this.body,
    this.id = '',
    this.title,
    this.documentId = '',
    this.type,
  });

  factory AppNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationModelFromJson(json);
  final String? body;
  final String id;
  final String? title;
  final String? type;

  @override
  final String documentId;

  Map<String, dynamic> toJson() => _$AppNotificationModelToJson(this);

  @override
  List<Object?> get props => [body, id, title];

  AppNotificationModel copyWith({
    String? body,
    String? id,
    String? title,
    String? documentId,
  }) {
    return AppNotificationModel(
      body: body ?? this.body,
      id: id ?? this.id,
      title: title ?? this.title,
      documentId: documentId ?? this.documentId,
    );
  }

  @override
  AppNotificationModel fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> json,
  ) {
    if (json.data() == null) return this;

    return AppNotificationModel.fromJson(json.data()!).copyWith(
      documentId: json.id,
    );
  }
}
