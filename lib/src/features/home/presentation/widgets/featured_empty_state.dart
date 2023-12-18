import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';

class FeaturedEmptyState extends ConsumerWidget {
  const FeaturedEmptyState({
    super.key,
    this.isRow = false,
    required this.text,
    required this.onRefresh,
  });

  final bool isRow;
  final String text;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final children = [
      Text(
        text,
        textAlign: TextAlign.center,
      ),
      IconButton(
        onPressed: onRefresh,
        icon: const SvgIcon(iconName: 'reload'),
      ),
    ];

    return Container(
      width: double.infinity,
      padding:
          isRow ? const EdgeInsets.only(left: 14) : const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        // TODO: refactor when: https://github.com/flutter/flutter/issues/115912
        color: surfaceContainer(ref),
        borderRadius: BorderRadius.circular(8),
      ),
      child: isRow
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
    );
  }
}
