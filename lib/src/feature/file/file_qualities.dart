enum FileQualities {
  /// 50 is default
  low(25),

  /// 50 is default
  normal(50),

  /// 75 is default
  medium(75),

  /// 90 is default
  high(90);

  final int value;
  const FileQualities(this.value);
}
