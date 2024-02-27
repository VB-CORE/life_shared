import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@immutable
@JsonSerializable()
final class NotificationModel with EquatableMixin {
  NotificationModel({
    this.id,
    this.campaignId,
    this.newsId,
    this.advertiseId,
    this.link,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
  final String? id;
  final String? campaignId;
  final String? newsId;
  final String? advertiseId;
  final String? link;

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);

  @override
  List<Object?> get props => [id, campaignId, newsId];

  NotificationModel copyWith({
    String? id,
    String? campaignId,
    String? newsId,
    String? advertiseId,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      campaignId: campaignId ?? this.campaignId,
      newsId: newsId ?? this.newsId,
      advertiseId: advertiseId ?? this.advertiseId,
    );
  }
}
