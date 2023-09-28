import 'package:json_annotation/json_annotation.dart';

enum NotificationTopics {
  @JsonValue('/topics/everyone')
  toAll,

  single,

  @JsonValue('/topics/campaigns')
  forCampaign;

  String get rawValue {
    switch (this) {
      case NotificationTopics.toAll:
        return '/topics/everyone';
      case NotificationTopics.single:
        return '/topics/single';
      case NotificationTopics.forCampaign:
        return '/topics/campaigns';
    }
  }
}
