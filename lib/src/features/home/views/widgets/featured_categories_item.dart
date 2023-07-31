import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/common/widgets/image_error.dart';
import 'package:shopit/src/features/categories/domain/entities/category.dart';

class FeaturedCategoriesItem extends StatelessWidget {
  const FeaturedCategoriesItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ClipRRect(
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
              color: Colors.black38,
              child: InkWell(
                onTap: () => context.pushNamed(
                  Routes.products.name,
                  extra: category,
                ),
                splashColor:
                    Theme.of(context).colorScheme.primary.withAlpha(50),
                highlightColor:
                    Theme.of(context).colorScheme.primary.withAlpha(10),
                child: Center(
                  child: Text(
                    category.name,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
