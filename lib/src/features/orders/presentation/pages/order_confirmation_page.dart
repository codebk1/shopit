import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class OrderConfirmationPage extends ConsumerWidget {
  const OrderConfirmationPage({
    super.key,
    required this.orderId,
  });

  final String orderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(orderProvider(orderId));

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
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    order?.formattedNumber ?? '',
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
                    context.goNamed(
                      Routes.order.name,
                      extra: order,
                    );
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
