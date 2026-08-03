import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'app_notification_model.g.dart';

@JsonSerializable()
final class AppNotificationModel extends BaseFirebaseModel<AppNotificationModel>
    with Equatable {
  AppNotificationModel({
    this.createdAt,
    this.body,
    this.id = '',
    this.title,
    this.documentId = '',
    this.type,
    this.read = false,
    this.targetId,
  });

  factory AppNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationModelFromJson(json);
  final String? body;
  final String id;
  final String? title;
  final AppNotificationType? type;
  final bool read;
  final String? targetId;
  @JsonKey(
    toJson: FirebaseTimeParse.dateTimeToTimestamp,
    fromJson: FirebaseTimeParse.datetimeFromTimestamp,
    defaultValue: DateTime.now,
  )
  final DateTime? createdAt;

  @override
  final String documentId;

  @override
  Map<String, dynamic> toJson() => _$AppNotificationModelToJson(this);

  @override
  List<Object?> get props => [body, id, title, read, targetId];

  AppNotificationModel copyWith({
    String? body,
    String? id,
    String? title,
    String? documentId,
    DateTime? createdAt,
    AppNotificationType? type,
    bool? read,
    String? targetId,
  }) {
    return AppNotificationModel(
      body: body ?? this.body,
      id: id ?? this.id,
      title: title ?? this.title,
      documentId: documentId ?? this.documentId,
      createdAt: createdAt ?? this.createdAt,
      type: type ?? this.type,
      read: read ?? this.read,
      targetId: targetId ?? this.targetId,
    );
  }

  @override
  AppNotificationModel fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> json,
  ) {
    if (json.data() == null) return this;

    return AppNotificationModel.fromJson(
      json.data()!,
    ).copyWith(documentId: json.id);
  }

  @override
  AppNotificationModel fromJson(Map<String, dynamic> json) {
    return AppNotificationModel.fromJson(json);
  }
}

enum AppNotificationType {
  @JsonValue('place')
  place,
  @JsonValue('event')
  event,
  @JsonValue('memory')
  memory,
  @JsonValue('system')
  system,
}
