/// Per-user content counters kept on `users/{uid}` for display only. The
/// authoritative count is always a collection group query over the content.
enum UserCounterFields {
  postCount,
  discussionCount,
  commentCount,
  likeCount,
  groupCount,
  voteCount,
}
