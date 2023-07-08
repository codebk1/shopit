import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/common/widgets/loader.dart';
import 'package:shopit/src/common/widgets/main_app_bar.dart';
import 'package:shopit/src/common/widgets/empty_state.dart';
import 'package:shopit/src/features/account/application/controllers/wishlist_controller.dart';
import 'package:shopit/src/features/account/presentation/widgets/wishlist_list.dart';

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
        data: (products) => products.isEmpty
            ? EmptyState(
                text: 'No products in wishlist.',
                onRefresh: () => ref.refresh(wishlistControllerProvider),
              )
            : WishlistList(products: products),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Loader(dark: true),
      ),
    );
  }
}
