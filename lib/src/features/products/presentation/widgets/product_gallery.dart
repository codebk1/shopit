import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:shopit/src/constants/colors.dart';
import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/features/products/domain/entities/product.dart';

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
              tag: widget.product.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.product.thumbnail,
                ),
              ),
            ),
            ...widget.product.gallery
                .map(
                  (photo) => ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      photo,
                    ),
                  ),
                )
                .toList()
          ],
        ),
        gapH10,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: AnimatedSmoothIndicator(
            activeIndex: _currentPhotoIndex,
            count: widget.product.gallery.length + 1,
            effect: ExpandingDotsEffect(
              dotWidth: 10,
              dotHeight: 10,
              dotColor: surfaceContainer,
              activeDotColor: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
