import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/constants/colors.dart';
import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/utils/currency_formatter.dart';
import 'package:shopit/src/common/widgets/main_app_bar.dart';
import 'package:shopit/src/features/wishlist/presentation/widgets/toggle_wishlist.dart';
import 'package:shopit/src/features/products/domain/entities/product.dart';
import 'package:shopit/src/features/products/presentation/widgets/product_add_to_cart.dart';
import 'package:shopit/src/features/products/presentation/widgets/product_gallery.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: '',
      ),
      body: SafeArea(
        child: Column(
          children: [
            ProductGallery(product: product),
            gapH24,
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: const BoxDecoration(
                  color: surfaceContainer,
                  borderRadius: BorderRadius.only(
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
                                  tag: 'wishlist-${product.id}',
                                  child: ToggleWishlist(product: product),
                                ),
                              ],
                            ),
                          ),
                          const SliverToBoxAdapter(child: gapH8),
                          SliverPersistentHeader(
                            pinned: true,
                            delegate: _PriceHeaderDelegate(product: product),
                          ),
                          const SliverToBoxAdapter(child: gapH24),
                          SliverToBoxAdapter(
                            child: Text(
                              'Description',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SliverToBoxAdapter(child: gapH4),
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
                    ProductAddToCart(itemId: product.id),
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

    return Column(
      children: [
        Container(
          color: surfaceContainer,
          child: Row(
            children: [
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    return Text(
                      ref.read(currencyFormatterProvider).format(product.price),
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
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
