import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

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

  late AnimationController _indicatorController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _indicatorController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final photos = [
      Hero(
        tag: GoRouterState.of(context).uri.queryParameters['tag'] ??
            widget.product.id,
        child: _Photo(
          url: widget.product.thumbnail,
          pageController: _pageController,
          index: 0,
        ),
      ),
      ...widget.product.gallery.indexed.map(
        (item) => _Photo(
          url: item.$2,
          pageController: _pageController,
          index: item.$1 + 1,
        ),
      ),
    ];

    return Column(
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: _pageController,
            allowImplicitScrolling: true,
            itemCount: photos.length,
            onPageChanged: (index) => setState(() {
              _swipeRight = index >= _currentPhotoIndex;
              _currentPhotoIndex = index;

              _indicatorController.forward(from: 0);
            }),
            itemBuilder: (context, index) => photos[index],
          ),
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
                animation: _indicatorController,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _Photo extends StatelessWidget {
  const _Photo({
    required this.url,
    required this.index,
    required this.pageController,
  });

  final String url;
  final int index;
  final PageController pageController;
  final double scaleDown = 0.25;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double offset = 0;

        if (pageController.position.hasContentDimensions &&
            pageController.page != null) {
          offset = pageController.page! - index;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Transform.scale(
            scale: 1 - offset.abs() * scaleDown,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: url,
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
        );
      },
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
  bool shouldRepaint(_Indicator oldDelegate) => false;
}
