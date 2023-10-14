// ignore_for_file: sort_constructors_first

enum StorageTypes {
  image('image/jpeg'),
  pdf('application/pdf');
  
  final String value;
  const StorageTypes(this.value);
}
