import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/cart/cart.dart';

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
              disabledForegroundColor: const Color.fromARGB(255, 255, 255, 255),
            )
          : null,
      child: addToCartController.isLoading
          ? const Loader()
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgIcon(
                  iconName: _isSuccess ? 'check' : 'cart',
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                gapW8,
                Text(
                  _isSuccess
                      ? context.l10n.productsAddToCartSuccess
                      : context.l10n.productsAddToCartButton,
                ),
              ],
            ),
    );
  }
}
