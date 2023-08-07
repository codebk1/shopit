import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/utils/utils.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/cart/cart.dart';

class QuantitySelector extends ConsumerWidget {
  const QuantitySelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(cartItemProvider);

    ref.listen(quantityControllerProvider(item), (_, next) {
      next.showAlertDialogOnError(context);
    });

    final quantityController = ref.watch(quantityControllerProvider(item));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          constraints: const BoxConstraints(),
          padding: const EdgeInsets.all(2),
          onPressed: quantityController.isLoading
              ? null
              : () => ref
                  .read(quantityControllerProvider(item).notifier)
                  .changeQuantity(item.quantity - 1),
          icon: const SvgIcon(iconName: 'minus'),
        ),
        SizedBox(
          width: 18,
          child: quantityController.isLoading
              ? const Loader(dark: true)
              : Text(
                  item.quantity.toString(),
                  textAlign: TextAlign.center,
                ),
        ),
        IconButton(
          constraints: const BoxConstraints(),
          padding: const EdgeInsets.all(2),
          onPressed: quantityController.isLoading
              ? null
              : () => ref
                  .read(quantityControllerProvider(item).notifier)
                  .changeQuantity(item.quantity + 1),
          icon: const SvgIcon(iconName: 'plus'),
        ),
      ],
    );
  }
}
