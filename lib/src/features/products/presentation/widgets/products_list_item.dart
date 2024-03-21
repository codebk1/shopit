import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class ProductsListItem extends ConsumerWidget {
  const ProductsListItem({
    super.key,
    this.heroTag,
    this.allowTap = true,
    this.addMargin = true,
    this.widgets = const [],
  });

  final bool allowTap;
  final bool addMargin;
  final List<Widget> widgets;
  final String? heroTag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(productIdProvider);
    final product = ref.watch(productProvider(id));

    return product.when(
      data: (product) => product == null
          ? const ProductsListItemError()
          : GestureDetector(
              onTap: allowTap
                  ? () => context.pushNamed(
                        Routes.product.name,
                        queryParameters: {'tag': '${product.id}-$heroTag'},
                        extra: product,
                      )
                  : null,
              child: Container(
                padding: const EdgeInsets.all(4),
                margin: addMargin
                    ? const EdgeInsets.symmetric(horizontal: 14)
                    : null,
                height: 75,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Hero(
                      tag: '${product.id}-$heroTag',
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
                            ref
                                .read(currencyFormatterProvider)
                                .format(product.price),
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
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
            ),
      error: (_, __) => const ProductsListItemError(),
      loading: () => const ProductsListItemLoader(),
    );
  }
}
