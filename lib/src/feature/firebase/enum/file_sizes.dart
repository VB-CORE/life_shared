enum FileSizes {
  /// 0.1 mb or 100 kb
  small(100),

  /// 0.5 mb or 500 kb
  medium(500),

  /// 1 mb or 1000 kb
  large(1000);

  const FileSizes(this.kbValue);

  final int kbValue;
  int get toByte => kbValue * 1024;
}
