import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/loader.dart';
import 'package:shopit/src/common/widgets/main_app_bar.dart';
import 'package:shopit/src/common/widgets/empty_state.dart';
import 'package:shopit/src/common/widgets/error_state.dart';
import 'package:shopit/src/common/widgets/remove_slidable.dart';
import 'package:shopit/src/features/products/application/controllers/products_controller.dart';
import 'package:shopit/src/features/wishlist/application/controllers/wishlist_controller.dart';
import 'package:shopit/src/features/wishlist/presentation/widgets/wishlist_item.dart';

class WishlistPage extends ConsumerWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlistController = ref.watch(wishlistControllerProvider);

    return Scaffold(
      appBar: const MainAppBar(
        title: 'Wishlist',
      ),
      body: wishlistController.when(
        data: (wishlist) => wishlist.items.isEmpty
            ? EmptyState(
                text: 'Wishlist is empty',
                onRefresh: () => ref.refresh(wishlistControllerProvider.future),
              )
            : ListView.separated(
                separatorBuilder: (context, index) => gapH8,
                itemCount: wishlist.items.length,
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
        error: (error, _) => ErrorState(
          text: error.toString(),
          onRefresh: () => ref.refresh(wishlistControllerProvider.future),
        ),
        loading: () => const Loader(dark: true),
      ),
    );
  }
}
