import 'package:json_annotation/json_annotation.dart';

enum Genders {
  @JsonValue('Erkek')
  male,
  @JsonValue('Kadın')
  female,
  @JsonValue('Diğer')
  other,
}
