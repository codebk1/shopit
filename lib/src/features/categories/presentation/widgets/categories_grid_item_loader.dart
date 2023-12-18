import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import 'package:shopit/src/core/core.dart';

class CategoriesGridItemLoader extends ConsumerWidget {
  const CategoriesGridItemLoader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Shimmer.fromColors(
      // TODO: refactor when: https://github.com/flutter/flutter/issues/115912
      baseColor: shimmerDarkBaseColor(ref),
      highlightColor: shimmerDarkHighlightColor(ref),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
