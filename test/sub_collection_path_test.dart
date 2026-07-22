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
