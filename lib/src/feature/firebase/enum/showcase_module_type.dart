// ignore_for_file: public_member_api_docs
import 'package:json_annotation/json_annotation.dart';

enum ShowcaseModuleType {
  @JsonValue('text')
  text,
  @JsonValue('image')
  image,
  @JsonValue('gallery')
  gallery,
  @JsonValue('hours')
  hours,
  @JsonValue('contact')
  contact,
  @JsonValue('map')
  map;
}
