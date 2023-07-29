import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/common/widgets/svg_icon.dart';
import 'package:shopit/src/features/products/domain/entities/product.dart';
import 'package:shopit/src/features/wishlist/application/controllers/wishlist_controller.dart';

class ToggleWishlist extends ConsumerWidget {
  const ToggleWishlist({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlist = ref.watch(wishlistControllerProvider);

    final inWishlist = wishlist.maybeWhen(
      data: (data) => data.items.any((item) => item == product.id),
      orElse: () => false,
    );

    return IconButton(
      onPressed: () =>
          ref.read(wishlistControllerProvider.notifier).toggle(product.id),
      icon: SvgIcon(
        iconName: inWishlist ? 'heart-filled' : 'heart',
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
