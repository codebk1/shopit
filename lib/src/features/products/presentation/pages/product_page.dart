import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const MainAppBar(
        title: '',
      ),
      body: SafeArea(
        child: Column(
          children: [
            ProductGallery(
              product: product,
            ),
            gapH24,
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  // TODO: refactor when: https://github.com/flutter/flutter/issues/115912
                  color: surfaceContainer(ref),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    product.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Hero(
                                  tag:
                                      '${GoRouterState.of(context).uri.queryParameters['tag'] ?? product.id}-toggle',
                                  child: ToggleWishlist(product: product),
                                ),
                              ],
                            ),
                          ),
                          sliverGapH8,
                          SliverPersistentHeader(
                            pinned: true,
                            delegate: _PriceHeaderDelegate(product: product),
                          ),
                          sliverGapH24,
                          SliverToBoxAdapter(
                            child: Text(
                              'Description',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          sliverGapH4,
                          SliverToBoxAdapter(
                            child: Text(
                              product.description,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                    gapH14,
                    ProductAddToCart(product: product),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _PriceHeaderDelegate({required this.product});

  final Product product;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = shrinkOffset / maxExtent;

    return Consumer(
      builder: (context, ref, child) {
        return Column(
          children: [
            Container(
              // TODO: refactor when: https://github.com/flutter/flutter/issues/115912
              color: surfaceContainer(ref),
              child: Row(
                children: [
                  Expanded(
                    child: Consumer(
                      builder: (context, ref, child) {
                        return Text(
                          ref
                              .read(currencyFormatterProvider)
                              .format(product.price),
                          style: TextStyle.lerp(
                            Theme.of(context).textTheme.titleMedium,
                            Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                            progress,
                          ),
                        );
                      },
                    ),
                  ),
                  Visibility(
                    visible: progress != 0,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 150),
                      opacity: progress,
                      child: ToggleWishlist(product: product),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
