import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/main_app_bar.dart';
import 'package:shopit/src/common/widgets/empty_state.dart';
import 'package:shopit/src/common/widgets/error_state.dart';
import 'package:shopit/src/common/widgets/remove_slidable.dart';
import 'package:shopit/src/features/products/application/controllers/products_controller.dart';
import 'package:shopit/src/features/products/presentation/widgets/products_list_loader.dart';
import 'package:shopit/src/features/wishlist/application/controllers/wishlist_controller.dart';
import 'package:shopit/src/features/wishlist/presentation/widgets/wishlist_item.dart';

class WishlistPage extends ConsumerWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlistController = ref.watch(wishlistControllerProvider);

    return Scaffold(
      appBar: MainAppBar(
        title: context.l10n.wishlistAppBarTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 14),
        child: wishlistController.when(
          data: (wishlist) => wishlist.items.isEmpty
              ? EmptyState(
                  text: context.l10n.wishlistEmptyState,
                  onRefresh: () => ref.invalidate(wishlistControllerProvider),
                )
              : ListView.separated(
                  padding: const EdgeInsets.only(bottom: 14),
                  itemCount: wishlist.items.length,
                  separatorBuilder: (_, __) => gapH8,
                  itemBuilder: (context, index) {
                    final id = wishlist.items[index];

                    return ProviderScope(
                      overrides: [productIdProvider.overrideWithValue(id)],
                      child: RemoveSlidable(
                        key: ValueKey(id),
                        onRemove: () => ref
                            .read(wishlistControllerProvider.notifier)
                            .toggle(id),
                        child: const WishlistItem(),
                      ),
                    );
                  },
                ),
          error: (_, __) => ErrorState(
            text: context.l10n.wishlistErrorState,
            onRefresh: () => ref.invalidate(wishlistControllerProvider),
          ),
          loading: () => const ProductsListLoader(),
        ),
      ),
    );
  }
}
