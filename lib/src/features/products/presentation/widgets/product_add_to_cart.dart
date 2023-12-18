import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class ProductAddToCart extends ConsumerStatefulWidget {
  const ProductAddToCart({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  ConsumerState<ProductAddToCart> createState() => _ProductAddToCartState();
}

class _ProductAddToCartState extends ConsumerState<ProductAddToCart> {
  bool _isSuccess = false;
  Future<void>? _addToCart;

  void _submit() {
    setState(() {
      _addToCart = ref.read(checkoutControllerProvider.notifier).addItem(
            CartItem(
              id: widget.product.id,
              price: widget.product.price,
            ),
          );
    });

    _addToCart!.then((_) {
      setState(() {
        _isSuccess = true;
      });

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _isSuccess = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _addToCart,
      builder: (context, snapshot) {
        final isLoading = snapshot.connectionState == ConnectionState.waiting;

        return ElevatedButton(
          onPressed: isLoading || _isSuccess ? null : _submit,
          style: _isSuccess
              ? ElevatedButton.styleFrom(
                  disabledBackgroundColor:
                      const Color.fromARGB(255, 27, 94, 32),
                  disabledForegroundColor:
                      const Color.fromARGB(255, 255, 255, 255),
                )
              : null,
          child: isLoading
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
      },
    );
  }
}
