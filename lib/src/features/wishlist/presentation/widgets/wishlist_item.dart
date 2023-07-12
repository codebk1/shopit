import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/features/products/data/repositories/products_repository.dart';
import 'package:transparent_image/transparent_image.dart';

class WishlistItem extends ConsumerWidget {
  const WishlistItem({
    super.key,
    required this.item,
  });

  final String item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider(item));

    return Column(
      children: [
        product.when(
          data: (product) => Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.symmetric(horizontal: 14),
            height: 75,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onInverseSurface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: product!.coverPhoto,
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
              ],
            ),
          ),
          error: (_, __) => Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.symmetric(horizontal: 14),
            height: 75,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onInverseSurface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Can not load product, please try again later or remove product from cart.',
                  ),
                ),
                gapW14,
                IconButton(
                  onPressed: () => ref.refresh(productProvider(item)),
                  icon: SvgPicture.asset(
                    'assets/icons/reload.svg',
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).hintColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
          loading: () => Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.onInverseSurface,
            highlightColor:
                Theme.of(context).colorScheme.onInverseSurface.withAlpha(50),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Container(
                    height: 75,
                    width: 85,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  gapW10,
                  Expanded(
                    child: Container(
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
