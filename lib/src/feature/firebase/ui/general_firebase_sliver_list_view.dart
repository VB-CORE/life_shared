import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:life_shared/life_shared.dart';

/// Sliver version of the [FirestoreListView]
class FirestoreSliverListView<T> extends StatelessWidget {
  const FirestoreSliverListView({
    required this.query,
    required this.itemBuilder,
    required this.onRetry,
    required this.itemGridBuilder,
    required this.emptyBuilder,
    super.key,
    this.pageSize = 10,
    this.isGridDesign = false,
  });

  /// That's firebase query for any child
  final Query<T?> query;

  /// That's builder for any child
  final FireStoreGeneralBuilder<T> itemBuilder;

  ///  That's builder for any child to grid
  final FireStoreGeneralBuilder<T> itemGridBuilder;

  /// Empty builder for error case
  final Widget Function(BuildContext context) emptyBuilder;

  /// When data is fetching is fail and you want to retry it you can use this callback
  final VoidCallback onRetry;

  /// Page size for fetching
  final int pageSize;

  /// If you want to use grid design you can use this parameter
  final bool isGridDesign;

  @override
  Widget build(BuildContext context) {
    return FirestoreQueryBuilder<T?>(
      query: query,
      pageSize: pageSize,
      builder: (context, snapshot, _) {
        if (snapshot.isFetching) {
          return const SliverFillRemaining(
            child: GeneralShimmer(height: CustomShimmerHeight.small),
          );
        }

        if (snapshot.docs.isEmpty || snapshot.hasError) {
          return SliverFillRemaining(
            child: emptyBuilder(context),
          );
        }

        return Visibility(
          visible: isGridDesign,
          replacement: _SliverList(
            snapshot: snapshot,
            itemBuilder: itemBuilder,
          ),
          child: _SliverGrid(
            snapshot: snapshot,
            itemGridBuilder: itemGridBuilder,
          ),
        );
      },
    );
  }
}

class _SliverList<T> extends StatelessWidget {
  const _SliverList({
    required this.itemBuilder,
    required this.snapshot,
    super.key,
  });

  final FireStoreGeneralBuilder<T> itemBuilder;
  final FirestoreQueryBuilderSnapshot<T?> snapshot;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: snapshot.docs.length,
      itemBuilder: (context, index) {
        if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
          snapshot.fetchMore();
        }
        final model = snapshot.docs[index].data();
        if (model == null) return const SizedBox.shrink();

        return itemBuilder(context, model);
      },
    );
  }
}

class _SliverGrid<T> extends StatelessWidget {
  const _SliverGrid({
    required this.itemGridBuilder,
    required this.snapshot,
    super.key,
  });

  final FireStoreGeneralBuilder<T> itemGridBuilder;
  final FirestoreQueryBuilderSnapshot<T?> snapshot;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: WidgetSizes.spacingSs,
        mainAxisSpacing: WidgetSizes.spacingS,
        mainAxisExtent: context.sized.dynamicHeight(0.24),
      ),
      itemCount: snapshot.docs.length,
      itemBuilder: (context, index) {
        if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
          snapshot.fetchMore();
        }
        final model = snapshot.docs[index].data();
        if (model == null) return const SizedBox.shrink();

        return itemGridBuilder(context, model);
      },
    );
  }
}
