// ignore_for_file: sort_constructors_first

enum FileSizes {
  /// 0.1 mb or 100 kb
  small(100),

  /// 0.5 mb or 500 kb
  medium(500),

  /// 1 mb or 1000 kb
  large(1000);

  final int _kbValue;
  const FileSizes(this._kbValue);

  int get toByte => _kbValue * 1024;
}
