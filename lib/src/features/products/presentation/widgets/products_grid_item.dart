import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/constants/colors.dart';
import 'package:shopit/src/utils/currency_formatter.dart';
import 'package:shopit/src/common/widgets/image_error.dart';
import 'package:shopit/src/features/products/domain/entities/product.dart';
import 'package:shopit/src/features/wishlist/presentation/widgets/toggle_wishlist.dart';

class ProductsGridItem extends ConsumerWidget {
  const ProductsGridItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        Routes.product.name,
        extra: product,
      ),
      child: Container(
        decoration: BoxDecoration(
          // TODO: refactor when: https://github.com/flutter/flutter/issues/115912
          color: surfaceContainer(ref),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Stack(
                  children: [
                    Hero(
                      tag: product.id,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CachedNetworkImage(
                          imageUrl: product.thumbnail,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: imageProvider,
                              ),
                            ),
                          ),
                          errorWidget: (_, __, ___) => const ImageError(),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Hero(
                        tag: 'wishlist-${product.id}',
                        child: ToggleWishlist(product: product),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      return Text(
                        ref
                            .read(currencyFormatterProvider)
                            .format(product.price),
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
