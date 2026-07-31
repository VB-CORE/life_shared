import 'package:json_annotation/json_annotation.dart';

/// Kind of card a merchant pins to their storefront.
enum MerchantShowcaseType {
  @JsonValue(1)
  campaign(1),
  @JsonValue(2)
  announcement(2),
  @JsonValue(3)
  event(3);

  const MerchantShowcaseType(this.value);

  final int value;

  static MerchantShowcaseType fromValue(int? value) =>
      MerchantShowcaseType.values.firstWhere(
        (type) => type.value == value,
        orElse: () => MerchantShowcaseType.announcement,
      );
}
