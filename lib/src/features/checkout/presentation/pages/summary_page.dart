import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

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
                            color:
                                Theme.of(context).colorScheme.surfaceContainer,
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
                            color:
                                Theme.of(context).colorScheme.surfaceContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: deliveryAddress.when(
                            data: (address) {
                              return AddressData(
                                address: address!,
                              );
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
                            color:
                                Theme.of(context).colorScheme.surfaceContainer,
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
                            color:
                                Theme.of(context).colorScheme.surfaceContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: paymentAddress.when(
                            data: (address) {
                              return AddressData(
                                address: address!,
                              );
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
                  SliverMainAxisGroup(
                    slivers: [
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: TextHeaderDelegate(
                          text: context.l10n.checkoutSummaryCommentHeader,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: GestureDetector(
                          onTap: () => showModalBottomSheet(
                            context: context,
                            showDragHandle: true,
                            isScrollControlled: true,
                            builder: (_) => const OrderCommentSheet(),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const SvgIcon(
                                  iconName: 'chat-bubble',
                                ),
                                gapW14,
                                Expanded(
                                  child: Text(
                                    checkout.comment ??
                                        context
                                            .l10n.checkoutSummaryNoCommentText,
                                  ),
                                ),
                                if (checkout.comment == null) ...[
                                  const Spacer(),
                                  const SvgIcon(
                                    iconName: 'chevron-right',
                                  ),
                                ],
                              ],
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
            action: () async {
              final order = Order(
                carrier: carrier.value!,
                payment: payment.value!,
                deliveryAddress: deliveryAddress.value!,
                paymentAddress: paymentAddress.value!,
                items: checkout.items,
                comment: checkout.comment,
              );

              final orderId = await ref.read(ordersServiceProvider).add(order);

              if (context.mounted) {
                context.goNamed(
                  Routes.orderConfirmation.name,
                  extra: orderId,
                );
              }
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
