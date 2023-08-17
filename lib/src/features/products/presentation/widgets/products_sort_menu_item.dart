import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/products/products.dart';

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
            SvgIcon(
              iconName: 'check',
              color: Colors.green.shade600,
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
