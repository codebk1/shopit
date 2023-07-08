import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:shopit/src/features/products/domain/entities/product.dart';
import 'package:shopit/src/features/account/application/controllers/wishlist_controller.dart';
import 'package:shopit/src/features/account/presentation/widgets/swipe.dart';

class WishlistItem extends ConsumerWidget {
  const WishlistItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ValueKey(product.id),
      direction: DismissDirection.endToStart,
      background: Swipe(
        text: 'Remove',
        iconPath: 'assets/icons/trash.svg',
        color: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.error,
        rowAlignment: MainAxisAlignment.end,
      ),
      onDismissed: (direction) {
        ref.read(wishlistControllerProvider.notifier).toggle(product);
      },
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: product.coverPhoto,
            fit: BoxFit.contain,
            width: 60,
            height: 60,
          ),
        ),
        title: Text(product.name),
        subtitle: Text('\$ ${product.price.toString()}'),
        onTap: () => context.pushNamed(
          'product',
          extra: product,
        ),
      ),
    );
  }
}
