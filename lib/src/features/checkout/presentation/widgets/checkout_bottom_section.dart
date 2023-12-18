import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class CheckoutBottomSection extends ConsumerStatefulWidget {
  const CheckoutBottomSection({
    super.key,
    required this.title,
    required this.action,
    required this.disabled,
  });

  final String title;
  final Future Function() action;
  final bool disabled;

  @override
  ConsumerState<CheckoutBottomSection> createState() =>
      _CheckoutBottomSectionState();
}

class _CheckoutBottomSectionState extends ConsumerState<CheckoutBottomSection> {
  Future? _future;

  void setAction() {
    setState(() {
      _future = widget.action();
    });
  }

  @override
  Widget build(BuildContext context) {
    final checkout = ref.watch(checkoutControllerProvider).requireValue;

    final carrierPrice = checkout.carrierId != null
        ? ref.watch(carrierProvider(checkout.carrierId!)).valueOrNull?.price
        : 0;

    final paymentPrice = checkout.paymentId != null
        ? ref.watch(paymentProvider(checkout.paymentId!)).valueOrNull?.price
        : 0;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: surfaceContainer(ref),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.light
                ? const Color.fromARGB(255, 255, 255, 255)
                : const Color.fromARGB(255, 0, 0, 0),
            blurRadius: 5,
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.l10n.checkoutTotalLabel),
                Text(
                  ref.read(currencyFormatterProvider).format(
                        checkout.itemsTotal +
                            (carrierPrice ?? 0) +
                            (paymentPrice ?? 0),
                      ),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          gapH8,
          FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              final isLoading =
                  snapshot.connectionState == ConnectionState.waiting;

              return ElevatedButton(
                onPressed: widget.disabled || isLoading ? null : setAction,
                child: isLoading
                    ? const Loader()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.title),
                          gapW10,
                          const SvgIcon(
                            iconName: 'arrow-long-right',
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ],
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
