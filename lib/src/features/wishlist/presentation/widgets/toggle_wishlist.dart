import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class ToggleWishlist extends ConsumerWidget {
  const ToggleWishlist({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlisted = ref.watch(wishlistControllerProvider).maybeWhen(
          skipLoadingOnReload: true,
          data: (wishlist) => wishlist.any((item) => item == product.id),
          orElse: () => false,
        );

    return IconButton(
      onPressed: () =>
          ref.read(wishlistControllerProvider.notifier).toggle(product.id),
      icon: SvgIcon(
        iconName: wishlisted ? 'heart-filled' : 'heart',
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
