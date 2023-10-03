import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/utils/utils.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/wishlist/wishlist.dart';
import 'package:shopit/src/features/products/products.dart';

class FeaturedProductsItem extends ConsumerWidget {
  const FeaturedProductsItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        Routes.product.name,
        queryParameters: {'tag': '${product.id}-featured'},
        extra: product,
      ),
      child: Container(
        width: 140,
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
                      tag: '${product.id}-featured',
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
                        tag: '${product.id}-featured-toggle',
                        child: ToggleWishlist(
                          product: product,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
