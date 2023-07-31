import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/constants/colors.dart';
import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/image_error.dart';
import 'package:shopit/src/features/products/domain/entities/product.dart';

class ProductsListItem extends ConsumerWidget {
  const ProductsListItem({
    super.key,
    required this.product,
    this.widgets = const [],
  });

  final Product product;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.product.name, extra: product),
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.symmetric(horizontal: 14),
        height: 75,
        decoration: BoxDecoration(
          // TODO: refactor when: https://github.com/flutter/flutter/issues/115912
          color: surfaceContainer(ref),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Hero(
              tag: product.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                  width: 78,
                  imageUrl: product.thumbnail,
                  errorWidget: (_, __, ___) => const ImageError(),
                ),
              ),
            ),
            gapW10,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    '\$${product.price}',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            ...widgets,
          ],
        ),
      ),
    );
  }
}
