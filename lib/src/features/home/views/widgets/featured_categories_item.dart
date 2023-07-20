import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:transparent_image/transparent_image.dart';

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
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: category.thumbnail,
              fit: BoxFit.cover,
              imageErrorBuilder: (_, __, ___) => const ImageError(),
            ),
            Material(
              color: Theme.of(context).colorScheme.primary.withAlpha(110),
              child: InkWell(
                onTap: () => context.pushNamed(
                  'products',
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
                          color: Theme.of(context).colorScheme.onPrimary,
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
