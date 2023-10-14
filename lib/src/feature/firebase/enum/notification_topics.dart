import 'package:json_annotation/json_annotation.dart';

enum NotificationTopics {
  @JsonValue('/topics/everyone')
  toAll,
  single,
  @JsonValue('/topics/campaigns')
  forCampaign,
  @JsonValue('/topics/news')
  news;

  String get rawValue {
    switch (this) {
      case NotificationTopics.toAll:
        return 'everyone';
      case NotificationTopics.single:
        return 'single';
      case NotificationTopics.forCampaign:
        return 'campaigns';
      case NotificationTopics.news:
        return 'news';
    }
  }
}
