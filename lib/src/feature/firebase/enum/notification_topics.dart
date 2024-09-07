import 'package:json_annotation/json_annotation.dart';

enum NotificationTopics {
  @JsonValue('everyone')
  toAll,
  single,
  @JsonValue('campaigns')
  forCampaign,
  @JsonValue('news')
  news,
  @JsonValue('advertise')
  advertise,
  @JsonValue('link')
  toAllLinked;

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
      case NotificationTopics.advertise:
        return 'advertise';
      case NotificationTopics.toAllLinked:
        return 'link';
    }
  }
}
