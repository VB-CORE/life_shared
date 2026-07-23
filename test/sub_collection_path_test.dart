import 'package:flutter_test/flutter_test.dart';
import 'package:life_shared/life_shared.dart';

void main() {
  group('SubCollectionPath', () {
    test('builds path under a root collection', () {
      final votes =
          CollectionPaths.approvedApplications.sub('abc', SubCollectionPaths.votes);

      expect(votes.path, 'approvedApplications/abc/votes');
    });

    test('supports nesting', () {
      final nested = CollectionPaths.approvedApplications
          .sub('abc', SubCollectionPaths.votes)
          .sub('uid', SubCollectionPaths.votes);

      expect(nested.path, 'approvedApplications/abc/votes/uid/votes');
    });

    test('builds group member and post paths', () {
      final members =
          CollectionPaths.groups.sub('gid', SubCollectionPaths.members);
      final posts =
          CollectionPaths.groups.sub('gid', SubCollectionPaths.posts);

      expect(members.path, 'groups/gid/members');
      expect(posts.path, 'groups/gid/posts');
    });

    test('builds nested group discussion entries path', () {
      final entries = CollectionPaths.groups
          .sub('gid', SubCollectionPaths.discussions)
          .sub('did', SubCollectionPaths.entries);

      expect(entries.path, 'groups/gid/discussions/did/entries');
    });

    test('equal paths are equal', () {
      final first =
          CollectionPaths.approvedApplications.sub('abc', SubCollectionPaths.votes);
      final second =
          CollectionPaths.approvedApplications.sub('abc', SubCollectionPaths.votes);
      final other =
          CollectionPaths.approvedApplications.sub('xyz', SubCollectionPaths.votes);

      expect(first, second);
      expect(first.hashCode, second.hashCode);
      expect(first, isNot(other));
    });
  });
}
