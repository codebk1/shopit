import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/loader.dart';
import 'package:shopit/src/common/widgets/main_app_bar.dart';
import 'package:shopit/src/common/widgets/empty_state.dart';
import 'package:shopit/src/common/widgets/error_state.dart';
import 'package:shopit/src/common/widgets/remove_slidable.dart';
import 'package:shopit/src/features/cart/application/controllers/cart_controller.dart';
import 'package:shopit/src/features/cart/presentation/widgets/cart_item.dart';
import 'package:shopit/src/features/cart/presentation/widgets/cart_summary.dart';

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
          IconButton(
            onPressed: cartController.isLoading
                ? null
                : ref.read(cartControllerProvider.notifier).clearCart,
            icon: SvgPicture.asset(
              'assets/icons/trash.svg',
              height: 18,
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
                        separatorBuilder: (context, index) => gapH8,
                        itemCount: cart.items.length,
                        itemBuilder: (context, index) {
                          final item = cart.items[index];
                          return ProviderScope(
                            overrides: [
                              cartItemProvider.overrideWithValue(item)
                            ],
                            child: RemoveSlidable(
                              key: ValueKey(item.id),
                              onRemove: () => ref
                                  .read(cartControllerProvider.notifier)
                                  .removeItem(item),
                              child: const CartItem(),
                            ),
                          );
                        },
                      ),
                    ),
                    gapH24,
                    const Padding(
                      padding: EdgeInsets.all(14),
                      child: CartSummary(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Checkout'),
                            gapW10,
                            SvgPicture.asset(
                              'assets/icons/arrow-long-right.svg',
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
