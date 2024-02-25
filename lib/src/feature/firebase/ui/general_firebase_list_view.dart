import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:life_shared/src/widget/shimmer/custom_shimmer_height.dart';
import 'package:life_shared/src/widget/shimmer/general_shimmer.dart';

typedef FireStoreGeneralBuilder<T> = Widget Function(
  BuildContext context,
  T model,
);

@immutable
final class GeneralFirestoreListView<T> extends StatelessWidget {
  const GeneralFirestoreListView({
    required this.query,
    required this.itemBuilder,
    required this.onRetry,
    required this.title,
    required this.emptyBuilder,
    this.shrinkWrap = false,
    super.key,
  });

  final bool shrinkWrap;

  final String title;

  /// That's firebase query for any child
  /// Example: newsCollection _customService.collectionReference(CollectionPaths.news,NewsModel());
  final Query<T?> query;

  /// That's builder for any child
  final FireStoreGeneralBuilder<T> itemBuilder;

  /// When data is fetching is fail and you want to retry it you can use this callback
  final VoidCallback onRetry;
  final Widget Function(BuildContext context) emptyBuilder;

  @override
  Widget build(BuildContext context) {
    return FirestoreListView<T?>(
      query: query,
      shrinkWrap: shrinkWrap,
      reverse: true,
      physics: const ClampingScrollPhysics(),
      loadingBuilder: (_) =>
          const GeneralShimmer(height: CustomShimmerHeight.small),
      emptyBuilder: emptyBuilder,
      itemBuilder: (context, doc) {
        final model = doc.data();
        if (model == null) return const SizedBox.shrink();
        return itemBuilder.call(context, model);
      },
    );
  }
}
