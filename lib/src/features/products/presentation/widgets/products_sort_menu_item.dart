import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class ProductsSortMenuItem extends ConsumerWidget implements PopupMenuEntry {
  const ProductsSortMenuItem({
    super.key,
    required this.value,
    required this.label,
  });

  final Sort value;
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSort = ref.watch(productsSortProvider);

    return PopupMenuItem(
      value: value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          if (value == selectedSort)
            const SvgIcon(
              iconName: 'check',
              color: Color.fromARGB(255, 67, 160, 71),
            ),
        ],
      ),
    );
  }

  @override
  final double height = kMinInteractiveDimension;

  @override
  bool represents(void value) => false;
}
