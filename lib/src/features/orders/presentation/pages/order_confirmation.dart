import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/exceptions/exceptions.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/checkout/checkout.dart';
import 'package:shopit/src/features/orders/orders.dart';

class OrderConfirmation extends ConsumerStatefulWidget {
  const OrderConfirmation({
    super.key,
    required this.orderId,
  });

  final String orderId;

  @override
  ConsumerState<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends ConsumerState<OrderConfirmation> {
  @override
  void initState() {
    super.initState();

    ref.read(checkoutControllerProvider.notifier).clear();
  }

  @override
  Widget build(BuildContext context) {
    final order = ref.watch(orderProvider(widget.orderId));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: order.when(
          data: (order) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  context.l10n.ordersConfirmationText,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        letterSpacing: -2,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                gapH24,
                const SvgIcon(
                  iconName: 'bag-check',
                  width: 150,
                  color: Color.fromARGB(255, 27, 94, 32),
                ),
                gapH24,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: surfaceContainer(ref),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '#${order?.number.toString().padLeft(6, '0')}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                gapH24,
                Text(
                  context.l10n.ordersConfirmationEstimatedDeliveryLabel,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat('yMMMMEEEEd').format(
                    DateTime.now().add(const Duration(days: 3)),
                  ),
                ),
                const Spacer(),
                Text(
                  context.l10n.ordersConfirmationExtraText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
                gapH28,
                OutlinedButton(
                  onPressed: () {
                    context.goNamed(Routes.home.name);
                  },
                  child: Text(context.l10n.ordersContinueShoppingButton),
                ),
                gapH14,
                ElevatedButton(
                  onPressed: () {
                    context.goNamed(Routes.orders.name);
                  },
                  child: Text(context.l10n.ordersOrderDetailsButton),
                ),
              ],
            );
          },
          error: (error, _) => Text(
            errorMessage(error, context),
          ),
          loading: () => const Loader(
            dark: true,
          ),
        ),
      ),
    );
  }
}
