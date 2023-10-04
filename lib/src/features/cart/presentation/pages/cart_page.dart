import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/products/products.dart';
import 'package:shopit/src/features/cart/cart.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartController = ref.watch(cartControllerProvider);

    return Scaffold(
      appBar: MainAppBar(
        title: context.l10n.cartAppBarTitle,
        showActions:
            cartController.hasValue && cartController.value!.items.isNotEmpty,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: cartController.isLoading
                  ? null
                  : ref.read(cartControllerProvider.notifier).clearCart,
              icon: const SvgIcon(
                iconName: 'trash',
                height: 18,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 14),
        child: cartController.when(
          data: (cart) => cart.items.isEmpty
              ? EmptyState(
                  text: context.l10n.cartEmptyState,
                  onRefresh: () => ref.invalidate(cartControllerProvider),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.only(bottom: 14),
                        itemCount: cart.items.length,
                        separatorBuilder: (_, __) => gapH8,
                        itemBuilder: (context, index) {
                          final item = cart.items[index];
                          return ProviderScope(
                            overrides: [
                              cartItemProvider.overrideWithValue(item),
                              productIdProvider.overrideWithValue(item.id),
                            ],
                            child: RemoveSlidable(
                              key: ValueKey(item.id),
                              onRemove: () => ref
                                  .read(cartControllerProvider.notifier)
                                  .removeItem(item),
                              child: const ProductsListItem(
                                heroTag: 'cart',
                                widgets: [QuantitySelector()],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const CartBottomSection(),
                  ],
                ),
          error: (_, __) => ErrorState(
            text: context.l10n.cartErrorState,
            onRefresh: () => ref.invalidate(cartControllerProvider),
          ),
          loading: () => const Loader(
            dark: true,
          ),
        ),
      ),
    );
  }
}
