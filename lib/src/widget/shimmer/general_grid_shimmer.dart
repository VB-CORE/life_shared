import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:life_shared/src/utility/size/index.dart';
import 'package:life_shared/src/utility/size/widget_custom_size.dart';
import 'package:life_shared/src/widget/padding/page_padding.dart';
import 'package:shimmer/shimmer.dart';

/// This is a grid shimmer that contains 10 items consisting of 150 height.
@immutable
final class GeneralGridShimmer extends StatelessWidget {
  const GeneralGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      padding: const PagePadding.onlyTopMedium(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: WidgetSizes.spacingS,
        mainAxisSpacing: WidgetSizes.spacingS,
        crossAxisCount: 2,
        mainAxisExtent: WidgetCustomSize.gridHeight.value,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: context.general.colorScheme.onPrimaryContainer,
          highlightColor:
              context.general.colorScheme.onPrimaryContainer.withOpacity(0.2),
          child: Container(
            alignment: Alignment.center,
            height: context.sized.dynamicHeight(.24),
            width: context.sized.width,
            color: context.general.colorScheme.secondary,
          ),
        );
      },
    );
  }
}
