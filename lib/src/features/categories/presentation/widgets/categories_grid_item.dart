import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class CategoriesGridItem extends ConsumerWidget {
  const CategoriesGridItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(categoryProvider(index));

    return category.when(
      data: (category) => ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: category.thumbnail,
              errorWidget: (_, __, ___) => const ImageError(),
            ),
            Material(
              color: const Color.fromARGB(150, 0, 0, 0),
              child: InkWell(
                onTap: () =>
                    context.pushNamed(Routes.products.name, extra: category),
                splashColor:
                    Theme.of(context).colorScheme.primary.withAlpha(50),
                highlightColor:
                    Theme.of(context).colorScheme.primary.withAlpha(10),
                child: Center(
                  child: Text(
                    category.name,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      error: (_, __) => const CategoriesGridItemError(),
      loading: () => const CategoriesGridItemLoader(),
    );
  }
}
