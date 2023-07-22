import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/loader.dart';
import 'package:shopit/src/features/cart/application/controllers/add_to_cart_controller.dart';

class ProductAddToCart extends ConsumerStatefulWidget {
  const ProductAddToCart({super.key, required this.itemId});

  final String itemId;

  @override
  ConsumerState<ProductAddToCart> createState() => _ProductAddToCartState();
}

class _ProductAddToCartState extends ConsumerState<ProductAddToCart> {
  bool _isSuccess = false;

  @override
  Widget build(BuildContext context) {
    ref.listen(addToCartControllerProvider, (previous, next) async {
      if (previous!.isLoading && !next.hasError) {
        setState(() {
          _isSuccess = true;
        });

        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            _isSuccess = false;
          });
        });
      }
    });

    final addToCartController = ref.watch(
      addToCartControllerProvider,
    );

    return ElevatedButton(
      onPressed: addToCartController.isLoading || _isSuccess
          ? null
          : () => ref
              .read(addToCartControllerProvider.notifier)
              .addItem(widget.itemId),
      style: _isSuccess
          ? ElevatedButton.styleFrom(
              disabledBackgroundColor: Colors.green.shade900,
              disabledForegroundColor: Colors.white,
            )
          : null,
      child: addToCartController.isLoading
          ? const Loader()
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/${_isSuccess ? 'check' : 'cart'}.svg',
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
                gapW8,
                Text(_isSuccess ? 'Added to cart' : 'Add to cart'),
              ],
            ),
    );
  }
}
