import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

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
          skipLoadingOnReload: true,
          data: (wishlist) => wishlist.isEmpty
              ? EmptyState(
                  text: context.l10n.wishlistEmptyState,
                  onRefresh: () => ref.invalidate(wishlistControllerProvider),
                )
              : ListView.separated(
                  padding: const EdgeInsets.only(bottom: 14),
                  itemCount: wishlist.length,
                  separatorBuilder: (_, __) => gapH8,
                  itemBuilder: (context, index) {
                    final productId = wishlist[index];

                    return ProviderScope(
                      overrides: [
                        productIdProvider.overrideWithValue(productId),
                      ],
                      child: RemoveSlidable(
                        key: ValueKey(productId),
                        onRemove: () => ref
                            .read(wishlistControllerProvider.notifier)
                            .toggle(productId),
                        child: const ProductsListItem(
                          heroTag: 'wishlist',
                        ),
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
