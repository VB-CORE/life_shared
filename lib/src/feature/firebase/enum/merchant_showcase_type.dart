import 'package:json_annotation/json_annotation.dart';

/// Kind of card a merchant pins to their storefront.
enum MerchantShowcaseType {
  @JsonValue(1)
  announcement(1),
  @JsonValue(2)
  campaign(2),
  @JsonValue(3)
  product(3),
  @JsonValue(4)
  gallery(4);

  const MerchantShowcaseType(this.value);

  final int value;

  static MerchantShowcaseType fromValue(int? value) =>
      MerchantShowcaseType.values.firstWhere(
        (type) => type.value == value,
        orElse: () => MerchantShowcaseType.announcement,
      );
}
