import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:life_shared/src/utility/size/index.dart';
import 'package:life_shared/src/widget/padding/page_padding.dart';
import 'package:shimmer/shimmer.dart';

/// This shimmer contains 10 items and is created with custom height.
/// Provides this height with context.sized.dynamicHeight() from Kartal.
@immutable
final class GeneralShimmer extends StatelessWidget {
  const GeneralShimmer({required this.height, super.key});

  /// Use [CustomShimmerHeight] for this value.
  final double height;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: const PagePadding.onlyTopMedium(),
      separatorBuilder: (context, index) {
        return const SizedBox(height: WidgetSizes.spacingL);
      },
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: context.general.colorScheme.onPrimaryContainer,
          highlightColor:
              context.general.colorScheme.onPrimaryContainer.withOpacity(0.2),
          child: Container(
            alignment: Alignment.center,
            height: context.sized.dynamicHeight(height),
            width: context.sized.width,
            color: context.general.colorScheme.secondary,
          ),
        );
      },
    );
  }
}
