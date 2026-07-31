/// Implemented by models the apps keep in a local cache box.
mixin CacheModel {
  String get id;

  CacheModel fromDynamicJson(dynamic json);

  Map<String, dynamic> toJson();
}
