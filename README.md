# Life Shared

![MSIX](https://cdnuploads.aa.com.tr/uploads/Contents/2023/04/08/thumbs_b_c_5649f0cbdbe81d8e99d19ce3a7cba944.jpg?v=110540)

Emek dolu olup ekip arkadaşlarımızla birlikte yazdığımız "[Hatay'ı Yaşat]" sizlerle! Tamamen gönüllü ruh ile Atatürk'ümüzün bize bırakmış olduğu son mirası deprem sonrasında elimizden geldiğince ayağa kaldırıp, umut olmaya değer katmaya çalışıyoruz. Bu paket ile geliştirdiğimiz hem web admin tarafını hemde mobile ugulamamız için ortak işlerimizi bu paket altında topladık.

## Table of Contents

[**Feature**](#feature)

- [File](#file-compress)
- [Firebase](#custom-service)

[**Model**](#model)

- [App notification model](#model)
- [Campaign model](#model)
- [Category model](#model)
- [Developer model](#model)
- [Notification model](#model)
- [Special agency model](#model)
- [Store model](#model)
- [Town model](#model)

[**Utility**](#utility)

- [Custom Logger](#custom-logger)
- [Firebase time parser](#firebase-time-parser)
- [Geo parser](#geo-parser)

[**Core**](#core)

- [Base Firebase Model](#base-firebase-model)

## Basic setup

To use the lints, add as a dev dependency in your `pubspec.yaml`:

```yaml
life_shared:
    git:
      url: https://github.com/VB-CORE/life_shared
```

# Usage

## Feature

### file compress

```dart
  final bytes = await file.readAsBytes();
  final compressFile =
        await FileCompress(bytes).compressByteFile(quality: FileQualities.low);
```

### Custom Service

- add

```dart
  Future<String?> add<T extends BaseFirebaseModel<T>>({
    required T model,
    required CollectionPaths path,
  });
```

- getList

```dart
  Future<List<T>> getList<T extends BaseFirebaseConvert<T>>({
    required T model,
    required CollectionPaths path,
  });
```

- getSingleData

```dart
  Future<T?> getSingleData<T extends BaseFirebaseConvert<T>>({
    required T model,
    required CollectionPaths path,
    required String id,
  });
```

- insertWithID

```dart
  Future<bool> insertWithID<T extends BaseFirebaseModel<T>>({
    required CollectionPaths ref,
    required T model,
    String? key,
  }) async {
    try {
      final collectionRef = ref.collection;
      await collectionRef.doc(key).set(model.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
```

- update

```dart
  Future<bool> update<T extends BaseFirebaseModel<T>>(
    CollectionPaths ref,
    T model,
  ) async {
    try {
      final collectionRef = ref.collection;
      await collectionRef.doc(model.documentId).update(model.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
```

- delete

```dart
  Future<bool> delete<T extends BaseFirebaseModel<T>>(
    CollectionPaths ref,
    T model,
  ) async {
    try {
      final collectionRef = ref.collection;
      await collectionRef.doc(model.documentId).delete();
      return true;
    } catch (e) {
      return false;
    }
  }
```

- deleteBy

```dart
  Future<bool> deleteBy<T>(
    CollectionPaths ref,
    FirebaseRecordFields field,
    T value,
  ) async {
    final collectionRef = ref.collection;
    final snapshot = await collectionRef
        .where(
          field.name,
          isEqualTo: value,
        )
        .get();
    if (snapshot.docs.isEmpty) return false;
    for (final doc in snapshot.docs) {
      await doc.reference.delete();
    }
    return true;
  }

```

### Custom Storage Service

- uploadImage

```dart

  Future<String?> uploadImage({
    required RootStorageName root,
    required String key,
    required Uint8List fileBytes,
    StorageTypes type = StorageTypes.image,
  });

```

- deleteAssets

```dart

  Future<void> deleteAssets({required List<String>? paths});

```

## Model

- `AppNotificationModel` extends (BaseFirebaseConvert)
- `CampaignModel` extends (BaseFirebaseModel)
- `CategoryModel` extends (BaseFirebaseConvert)
- `DeveloperModel` extends (BaseFirebaseConvert)
- `NotificationModel` 
- `SpecialAgencyModel` extends (BaseFirebaseModel)
- `StoreModel` extends (BaseFirebaseModel)
- `TownModel` extends (BaseFirebaseConvert)

## Utility

### Firebase Time Parser

```dart

  toJson: FirebaseTimeParse.dateTimeToTimestamp,
  fromJson: FirebaseTimeParse.datetimeFromTimestamp,

```

### Custom Logger

```dart

 CustomLogger.log(message);

```

### Geo Parser

```dart

  toJson: GeoParser.toJsonGeoPoint(location),
  fromJson: GeoParser.fromJsonGeoPoint(location),

```

## Core

### Base FireBase Model

```dart
abstract class BaseFirebaseModel<T> extends BaseFirebaseConvert<T> {
  Map<String, dynamic> toJson();
  @override
  String get documentId;
}

abstract class BaseFirebaseConvert<T> {
  T fromFirebase(DocumentSnapshot<Map<String, dynamic>> json);
  String get documentId;
}
```

# Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].  

[tracker]: https://github.com/VB-CORE/life_shared/issues

# LICENSE 

[privacy policy](https://www.hatayiyasat.com/gizlilik)

# Connect With Me

[![Instagram: HatayıYaşat](https://img.shields.io/badge/Hatay'%C4%B1-ya%C5%9Fat-141430?logo=Instagram&logoColor=fff)][instagram]
[![GitHub: VBCore](https://img.shields.io/badge/VB-Core-141430?logo=Github&logoColor=fff)][github]
[![Twitter: GrafikHerif](https://img.shields.io/badge/Grafik-Herif-141430?logo=Twitter&logoColor=fff)][twitter]

[github]: https://github.com/VB-CORE

[twitter]: https://twitter.com/grafikherif

[instagram]: https://www.instagram.com/hatayiyasat/

[Hatay'ı Yaşat]: https://www.hatayiyasat.com/