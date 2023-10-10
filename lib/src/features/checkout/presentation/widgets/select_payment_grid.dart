import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/utils/utils.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/payments/payments.dart';
import 'package:shopit/src/features/checkout/checkout.dart';

class SelectPaymentGrid extends ConsumerWidget {
  const SelectPaymentGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkout = ref.watch(checkoutControllerProvider).requireValue;
    final payments = ref.watch(paymentsProvider);

    ref.listen(paymentsProvider, (_, next) {
      if (checkout.paymentId == null && next.hasValue) {
        final payments = next.valueOrNull;

        if (payments != null) {
          ref
              .read(checkoutControllerProvider.notifier)
              .setPayment(payments.first);
        }
      }
    });

    return payments.when(
      skipLoadingOnRefresh: false,
      data: (payments) => SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 4 / 5,
        ),
        itemCount: payments.length,
        itemBuilder: (context, index) {
          final payment = payments[index];

          return GestureDetector(
            onTap: () => ref
                .read(checkoutControllerProvider.notifier)
                .setPayment(payment),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: surfaceContainer(ref),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: checkout.paymentId == payment.id
                      ? Theme.of(context).colorScheme.primary
                      : const Color.fromARGB(0, 0, 0, 0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgIcon(
                    iconName: switch (payment.type) {
                      PaymentType.wireTransfer => 'wire-transfer',
                      PaymentType.cod => 'cash',
                      PaymentType.creditCard => 'credit-card',
                      PaymentType.online => 'globe',
                    },
                    width: 35,
                  ),
                  Text(
                    payment.name,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    ref.read(currencyFormatterProvider).format(payment.price),
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
          );
        },
      ),
      error: (error, _) => SliverToBoxAdapter(
        child: ErrorBox(
          error: error,
          onRefresh: () => ref.invalidate(paymentsProvider),
          height: 145,
        ),
      ),
      loading: () => const SliverToBoxAdapter(
        child: GridLoader(
          itemCount: 3,
          crossAxisCount: 3,
          aspectRatio: 4 / 5,
        ),
      ),
    );
  }
}
