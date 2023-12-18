import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class ProductGallery extends StatefulWidget {
  const ProductGallery({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery>
    with SingleTickerProviderStateMixin {
  var _currentPhotoIndex = 0;
  var _swipeRight = true;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

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
              _swipeRight = index >= _currentPhotoIndex;
              _currentPhotoIndex = index;

              _controller.forward(from: 0);
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
            return CustomPaint(
              size: const Size.fromHeight(10),
              painter: _Indicator(
                activeIndex: _currentPhotoIndex,
                swipeRight: _swipeRight,
                count: widget.product.gallery.length + 1,
                activeDotWidth: 20,
                spacing: 10,
                color: surfaceContainer(ref),
                activeColor: Theme.of(context).colorScheme.primary,
                animation: _controller,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _Indicator extends CustomPainter {
  _Indicator({
    required this.activeIndex,
    required this.swipeRight,
    required this.count,
    required this.activeDotWidth,
    required this.spacing,
    required this.color,
    required this.activeColor,
    required this.animation,
  }) : super(repaint: animation);

  final int activeIndex;
  final bool swipeRight;
  final int count;
  final double activeDotWidth;
  final double spacing;
  final Color color;
  final Color activeColor;
  final Animation animation;

  @override
  void paint(Canvas canvas, Size size) {
    final centerOffsetX =
        (size.width - count * size.height - count * spacing - activeDotWidth) /
            2;

    for (var i = 0; i < count; i++) {
      final dx = i * spacing +
          i * size.height +
          (i >= activeIndex + 1 ? activeDotWidth : 0) +
          spacing / 2;

      var l1 = 0.0;
      var r1 = 0.0;

      if (swipeRight) {
        if (i == activeIndex) {
          l1 = activeDotWidth * (1 - animation.value);
          r1 = activeDotWidth;
        }

        if (i == activeIndex - 1) {
          r1 = activeDotWidth * (1 - animation.value);
        }
      } else {
        if (i == activeIndex) {
          r1 = activeDotWidth * animation.value;
        }

        if (i == activeIndex + 1) {
          l1 = -activeDotWidth * (1 - animation.value);
        }
      }

      var dotColor = color;

      if (i == activeIndex) {
        dotColor = Color.lerp(color, activeColor, animation.value)!;
      }

      if (swipeRight && i == activeIndex - 1 ||
          !swipeRight && i == activeIndex + 1) {
        dotColor = Color.lerp(activeColor, color, animation.value)!;
      }

      if (i == 0 && activeIndex == 0 && swipeRight) {
        l1 = 0.0;
        r1 = activeDotWidth - activeDotWidth * animation.value;
        dotColor = activeColor;
      }

      canvas.drawRRect(
        RRect.fromLTRBR(
          dx + centerOffsetX + l1,
          0,
          dx + size.height + centerOffsetX + r1,
          size.height,
          const Radius.circular(100),
        ),
        Paint()..color = dotColor,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _Indicator oldDelegate) => true;
}
