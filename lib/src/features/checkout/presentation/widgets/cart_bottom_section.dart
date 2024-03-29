import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class CartBottomSection extends ConsumerWidget {
  const CartBottomSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkout = ref.watch(checkoutControllerProvider);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.light
                ? const Color.fromARGB(255, 255, 255, 255)
                : const Color.fromARGB(255, 0, 0, 0),
            blurRadius: 5,
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.l10n.cartTotalHeader),
                checkout.when(
                  skipLoadingOnReload: true,
                  data: (checkout) => Text(
                    ref
                        .read(currencyFormatterProvider)
                        .format(checkout.itemsTotal),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  loading: () => const ShimmerText(
                    width: 100,
                  ),
                  error: (e, __) => Text(e.toString()),
                ),
              ],
            ),
          ),
          gapH8,
          ElevatedButton(
            onPressed: !checkout.hasValue
                ? null
                : () => context.pushNamed(Routes.checkout.name),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(context.l10n.cartCheckoutButton),
                gapW10,
                const SvgIcon(
                  iconName: 'arrow-long-right',
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
