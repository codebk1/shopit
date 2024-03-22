import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class PaymentPage extends ConsumerWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkout = ref.watch(checkoutControllerProvider).requireValue;

    return Scaffold(
      appBar: MainAppBar(
        title: context.l10n.checkoutPaymentAppBarTitle,
        showActions: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(14),
            child: CheckoutHeader(currentStep: 2),
          ),
          gapH14,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: CustomScrollView(
                slivers: [
                  SliverMainAxisGroup(
                    slivers: [
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: TextHeaderDelegate(
                          text: context.l10n.checkoutSelectPaymentMethodHeader,
                        ),
                      ),
                      const SelectPaymentGrid(),
                    ],
                  ),
                  sliverGapH24,
                  SliverMainAxisGroup(
                    slivers: [
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: TextHeaderDelegate(
                          text: context.l10n.checkoutSelectPaymentAddressHeader,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SelectAddressSection(
                          selectedAddressId: checkout.paymentAddressId,
                          type: AddressType.payment,
                        ),
                      ),
                    ],
                  ),
                  sliverGapH14,
                ],
              ),
            ),
          ),
          CheckoutBottomSection(
            title: context.l10n.checkoutSummaryButton,
            action: () async {
              await ref.read(checkoutControllerProvider.notifier).setStep(3);

              if (context.mounted) {
                context.pushReplacementNamed(Routes.summary.name);
              }
            },
            disabled:
                checkout.paymentAddressId == null || checkout.paymentId == null,
          ),
        ],
      ),
    );
  }
}
