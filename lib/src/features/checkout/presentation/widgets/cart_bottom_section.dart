import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/utils/utils.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/checkout/checkout.dart';

class CartBottomSection extends ConsumerWidget {
  const CartBottomSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkout = ref.watch(checkoutControllerProvider);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: surfaceContainer(ref),
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
