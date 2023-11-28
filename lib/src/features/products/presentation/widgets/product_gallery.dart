import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/products/products.dart';

class ProductGallery extends StatefulWidget {
  const ProductGallery({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  var _currentPhotoIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.5,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) => setState(() {
              _currentPhotoIndex = index;
            }),
          ),
          items: [
            Hero(
              tag: GoRouterState.of(context).uri.queryParameters['tag'] ??
                  widget.product.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: widget.product.thumbnail,
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
            ...widget.product.gallery.map(
              (photo) => ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: photo,
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
          ],
        ),
        gapH10,
        Consumer(
          builder: (context, ref, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: AnimatedSmoothIndicator(
                activeIndex: _currentPhotoIndex,
                count: widget.product.gallery.length + 1,
                effect: ExpandingDotsEffect(
                  dotWidth: 10,
                  dotHeight: 10,
                  // TODO: refactor when: https://github.com/flutter/flutter/issues/115912
                  dotColor: surfaceContainer(ref),
                  activeDotColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
