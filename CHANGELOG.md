# Changelog

## 7.0.0

Breaking. Both apps must move to this tag together; consumers stay on 6.1.0
until they are ready.

### Changed

- Firebase majors: `cloud_firestore` 5 → 6, `firebase_storage` 12 → 13,
  `firebase_ui_firestore` 1 → 2. These constraints were what pinned both
  consumer apps to the old Firebase suite.
- `image_cropper` 8 → 11, `kartal` → 4.2.0, plus routine bumps across
  `intl`, `json_annotation`, `equatable`, `image_picker`, `logger`, `uuid`,
  `collection`, `flutter_image_compress`.
- Minimum Flutter raised to 3.38.0 (`image_picker` 1.2.3 requires it).
- `image_cropper` stops at 11, not 12: with Swift Package Manager enabled,
  `file_picker` pins DKImagePickerController to a branch requiring
  `TOCropViewController` 2.6–3.0, while image_cropper 12.1+ moved to 3.x.
  image_cropper 12.0.0 is not a middle ground — its SPM manifest asks for
  TOCrop 2.8.0 while its Objective-C sources include 3.x headers, so it fails
  to compile.

## 6.1.0

### Added

- `FirestoreService.getListFromQuery` and `FirestoreService.countQuery` — run a
  caller-built `Query` through the same guard as the rest of the service.
  `collectionReference` handed out a raw query the caller had to execute
  itself, so those calls threw `FirebaseException` instead of returning a
  `FirestoreResult`.

## 6.0.0

Breaking. Both apps must move to this tag together.

### Added

- `UserModel` — one definition replacing the divergent copies in life_admin
  (`pending_life_shared`) and hatayi_yasat (`product/model/auth`). Adds ban
  fields (`isBanned`, `bannedAt`, `bannedReason`, `bannedBy`) and per-user
  content counters (`postCount`, `discussionCount`, `commentCount`,
  `likeCount`, `groupCount`, `voteCount`).
- `UserApplicationModel` — merchant application embedded in
  `users/{uid}.application`, replacing the flat `applicationStatus` string.
- `AuthorModel` — author snapshot shared by posts, discussions, entries and
  topic comments.
- Community models moved out of the client: `GroupModel`, `GroupMemberModel`,
  `GroupPostModel`, `GroupDiscussionModel`, `GroupDiscussionEntryModel`,
  `LikedPostModel`, `VoteModel`.
- Moderation models moved out of the panel: `TopicModel`, `CommentModel`,
  `CouponModel`, `RedemptionModel`, `ShowcaseModule`.
- Enums: `UserRole`, `AppPermission`, `UserApplicationStatus`,
  `GroupMemberRole`, `GroupType`, `CouponStatus`, `ShowcaseModuleType`,
  `CommunityCounterFields`, `UserCounterFields`.
- `CacheModel` mixin, moved from the client so `UserModel` can be cached
  without the client redeclaring it.
- `GroupModel` write locks: `isPostsLocked`, `isDiscussionsLocked`,
  `isCommentsLocked`.
- `GroupMemberModel.uid` — stored as a field, not just the document id, so a
  collection group query can find every membership of one user.
- `isDeleted` on `GroupPostModel`, `GroupDiscussionModel`,
  `GroupDiscussionEntryModel`, `LikedPostModel`, `VoteModel`, `TopicModel`
  and `CommentModel`.
- `StoreModel.isVerified`, derived from `ownerId`.
- `build.yaml` with `explicit_to_json: true`. Models are written straight to
  Firestore, so a nested model has to serialize to a Map.

### Changed

- `roleType` is a `UserRole` enum instead of a raw int. The wire format is
  unchanged (1 = admin, 2 = user).
- `TopicModel` and `CommentModel` carry `author: AuthorModel` instead of a
  flat `authorUid`, matching the rest of the content collections.
- `RegionalTownModel.towns` now serializes its sub-items to maps. It was
  emitting raw Dart objects, which Firestore rejects.
- Minimum SDK is 3.9.0, for null-aware map entries.

### Removed

- `StoreModel.isVerified` as a stored field. A store with an `ownerId` is a
  verified merchant; a separate boolean was a second source for one fact.
- `UserModel.rates` — never written by either app.

## 0.0.1

* TODO: Describe initial release.
