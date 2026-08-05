import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@immutable
@JsonSerializable()
final class NotificationModel with Equatable {
  NotificationModel({
    this.id,
    this.campaignId,
    this.newsId,
    this.advertiseId,
    this.memoryId,
    this.link,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
  final String? id;
  final String? campaignId;
  final String? newsId;
  final String? advertiseId;
  final String? memoryId;
  final String? link;

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);

  @override
  List<Object?> get props => [id, campaignId, newsId, advertiseId, memoryId, link];

  NotificationModel copyWith({
    String? id,
    String? campaignId,
    String? newsId,
    String? advertiseId,
    String? memoryId,
    String? link,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      campaignId: campaignId ?? this.campaignId,
      newsId: newsId ?? this.newsId,
      advertiseId: advertiseId ?? this.advertiseId,
      memoryId: memoryId ?? this.memoryId,
      link: link ?? this.link,
    );
  }
}
