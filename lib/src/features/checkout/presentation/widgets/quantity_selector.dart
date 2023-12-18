import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class QuantitySelector extends ConsumerWidget {
  const QuantitySelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(cartItemProvider);
    final checkoutController = ref.watch(checkoutControllerProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          constraints: const BoxConstraints(),
          padding: const EdgeInsets.all(2),
          onPressed: checkoutController.isLoading
              ? null
              : () => ref
                  .read(checkoutControllerProvider.notifier)
                  .removeItem(item),
          icon: const SvgIcon(iconName: 'minus'),
        ),
        SizedBox(
          width: 18,
          child: Text(
            item.quantity.toString(),
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          constraints: const BoxConstraints(),
          padding: const EdgeInsets.all(2),
          onPressed: checkoutController.isLoading
              ? null
              : () =>
                  ref.read(checkoutControllerProvider.notifier).addItem(item),
          icon: const SvgIcon(iconName: 'plus'),
        ),
      ],
    );
  }
}
