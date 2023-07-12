import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shopit/src/features/products/domain/entities/product.dart';
import 'package:shopit/src/features/wishlist/application/controllers/wishlist_controller.dart';

class ToggleWishlist extends ConsumerWidget {
  const ToggleWishlist({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlist = ref.watch(wishlistControllerProvider).value;

    return Hero(
      tag: 'wishlist-${product.id}',
      child: IconButton(
        onPressed: () {
          ref.read(wishlistControllerProvider.notifier).toggle(product.id);
        },
        icon: _Heart(
          filled: wishlist!.items.any((item) => item == product.id),
        ),
      ),
    );
  }
}

class _Heart extends StatelessWidget {
  const _Heart({
    required this.filled,
  });

  final bool filled;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      filled ? 'assets/icons/heart-filled.svg' : 'assets/icons/heart.svg',
      colorFilter: ColorFilter.mode(
        Theme.of(context).colorScheme.primary,
        BlendMode.srcIn,
      ),
    );
  }
}
