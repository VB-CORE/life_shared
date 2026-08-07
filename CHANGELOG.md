# Changelog

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
