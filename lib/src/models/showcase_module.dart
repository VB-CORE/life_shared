// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:life_shared/life_shared.dart';

part 'showcase_module.g.dart';

@immutable
@JsonSerializable(includeIfNull: false)
class ShowcaseModule {
  const ShowcaseModule({
    required this.id,
    required this.type,
    required this.order,
    this.title,
    this.body,
    this.images = const [],
  });

  factory ShowcaseModule.fromJson(Map<String, dynamic> json) =>
      _$ShowcaseModuleFromJson(json);

  final String id;
  final ShowcaseModuleType type;
  final int order;
  final String? title;
  final String? body;
  final List<String> images;

  ShowcaseModule copyWith({
    String? id,
    ShowcaseModuleType? type,
    int? order,
    String? title,
    String? body,
    List<String>? images,
  }) {
    return ShowcaseModule(
      id: id ?? this.id,
      type: type ?? this.type,
      order: order ?? this.order,
      title: title ?? this.title,
      body: body ?? this.body,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toJson() => _$ShowcaseModuleToJson(this);
}
