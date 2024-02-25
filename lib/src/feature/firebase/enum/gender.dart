import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/src/models/base_dropdown_model.dart';

enum Genders implements BaseDropDownModel {
  @JsonValue('Erkek')
  male,
  @JsonValue('Kadın')
  female,
  @JsonValue('Diğer')
  other;

  @override
  String get displayName {
    return switch (this) {
      Genders.other => 'Erkek/Kadın',
      Genders.male => 'Erkek',
      Genders.female => 'Kadın',
    };
  }
}
