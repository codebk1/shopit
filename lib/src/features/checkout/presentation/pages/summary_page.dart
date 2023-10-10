import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/exceptions/exceptions.dart';
import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/utils/utils.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/products/products.dart';
import 'package:shopit/src/features/addresses/addresses.dart';
import 'package:shopit/src/features/carriers/carriers.dart';
import 'package:shopit/src/features/payments/payments.dart';
import 'package:shopit/src/features/checkout/checkout.dart';

class SummaryPage extends ConsumerWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkout = ref.watch(checkoutControllerProvider).requireValue;

    final deliveryAddress = ref.watch(checkoutAddressProvider(
      checkout.deliveryAddressId,
      AddressType.delivery,
    ));

    final paymentAddress = ref.watch(checkoutAddressProvider(
      checkout.paymentAddressId,
      AddressType.payment,
    ));

    final carrier = ref.watch(carrierProvider(checkout.carrierId!));
    final payment = ref.watch(paymentProvider(checkout.paymentId!));

    return Scaffold(
      appBar: MainAppBar(
        title: context.l10n.checkoutSummaryAppBarTitle,
        showActions: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(14),
            child: CheckoutHeader(currentStep: 3),
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
                          text: context.l10n.checkoutSummaryCartHeader,
                        ),
                      ),
                      SliverList.separated(
                        separatorBuilder: (context, index) => gapH8,
                        itemCount: checkout.items.length,
                        itemBuilder: (context, index) {
                          final item = checkout.items[index];

                          return ProviderScope(
                            overrides: [
                              productIdProvider.overrideWithValue(item.id),
                              cartItemProvider.overrideWithValue(item),
                            ],
                            child: const ProductsListItem(
                              allowTap: false,
                              addMargin: false,
                              widgets: [CartListItemQuantity()],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  sliverGapH24,
                  SliverMainAxisGroup(
                    slivers: [
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: TextHeaderDelegate(
                          text: context.l10n.checkoutSummaryDeliveryHeader,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: surfaceContainer(ref),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: carrier.when(
                            data: (carrier) {
                              return Row(
                                children: [
                                  CarrierIcon(type: carrier!.type),
                                  gapW14,
                                  Text(carrier.name),
                                  const Spacer(),
                                  Text(
                                    ref
                                        .read(currencyFormatterProvider)
                                        .format(carrier.price),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              );
                            },
                            error: (error, _) => Text(
                              errorMessage(error, context),
                            ),
                            loading: () => const ShimmerText(
                              width: double.infinity,
                              lineHeight: 35,
                            ),
                          ),
                        ),
                      ),
                      sliverGapH14,
                      SliverToBoxAdapter(
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: surfaceContainer(ref),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: deliveryAddress.when(
                            data: (address) {
                              return AddressData(address: address!);
                            },
                            error: (error, _) => Text(
                              errorMessage(error, context),
                            ),
                            loading: () => const ShimmerText(
                              width: 150,
                              oddLinesWidth: 100,
                              lines: 5,
                              lineHeight: 20,
                              extraHeight: 5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  sliverGapH24,
                  SliverMainAxisGroup(
                    slivers: [
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: TextHeaderDelegate(
                          text: context.l10n.checkoutSummaryPaymentHeader,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: surfaceContainer(ref),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: payment.when(
                            data: (payment) {
                              return Row(
                                children: [
                                  PaymentIcon(type: payment!.type),
                                  gapW14,
                                  Text(payment.name),
                                  const Spacer(),
                                  Text(
                                    ref
                                        .read(currencyFormatterProvider)
                                        .format(payment.price),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              );
                            },
                            error: (error, _) => Text(
                              errorMessage(error, context),
                            ),
                            loading: () => const ShimmerText(
                              width: double.infinity,
                              lineHeight: 35,
                            ),
                          ),
                        ),
                      ),
                      sliverGapH14,
                      SliverToBoxAdapter(
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: surfaceContainer(ref),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: paymentAddress.when(
                            data: (address) {
                              return AddressData(address: address!);
                            },
                            error: (error, _) => Text(
                              errorMessage(error, context),
                            ),
                            loading: () => const ShimmerText(
                              width: 150,
                              oddLinesWidth: 100,
                              lines: 6,
                              lineHeight: 20,
                              extraHeight: 5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  sliverGapH24,
                  const SliverToBoxAdapter(
                    child: CheckoutTotalsBox(),
                  ),
                  sliverGapH24,
                ],
              ),
            ),
          ),
          CheckoutBottomSection(
            title: context.l10n.checkoutPlaceOrderButton,
            action: () {
            },
            disabled: carrier.isLoading ||
                payment.isLoading ||
                deliveryAddress.isLoading ||
                paymentAddress.isLoading,
          ),
        ],
      ),
    );
  }
}
