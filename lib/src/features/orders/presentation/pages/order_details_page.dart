import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class OrderDetailsPage extends ConsumerWidget {
  const OrderDetailsPage({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: MainAppBar(
        title: order.formattedNumber,
        showActions: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 14,
          right: 14,
          top: 14,
        ),
        child: CustomScrollView(
          slivers: [
            sliverGapH14,
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(context.l10n.ordersDetailsCurrentStatusLabel),
                        OrderStatusChip(status: order.status)
                      ],
                    ),
                    gapH14,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(context.l10n.ordersDetailsTotalLabel),
                        Text(
                          ref
                              .read(currencyFormatterProvider)
                              .format(order.total),
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    gapH4,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(context.l10n.ordersDetailsLastUpdatedLabel),
                        Text(
                          DateFormat('yMMMMEEEEd').format(order.updatedAt!),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            sliverGapH24,
            SliverMainAxisGroup(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: TextHeaderDelegate(
                    text: context.l10n.ordersDetailsCommentHeader,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: surfaceContainer(ref),
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
                            order.comment ??
                                context.l10n.ordersDetailsNoCommentText,
                          ),
                        ),
                      ],
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
                    child: Row(
                      children: [
                        CarrierIcon(type: order.carrier.type),
                        gapW14,
                        Text(order.carrier.name),
                        const Spacer(),
                        Text(
                          ref
                              .read(currencyFormatterProvider)
                              .format(order.carrier.price),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
                    child: AddressData(
                      address: order.deliveryAddress,
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
                    child: Row(
                      children: [
                        PaymentIcon(type: order.payment.type),
                        gapW14,
                        Text(order.payment.name),
                        const Spacer(),
                        Text(
                          ref
                              .read(currencyFormatterProvider)
                              .format(order.payment.price),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
                    child: AddressData(
                      address: order.paymentAddress,
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
                    text: context.l10n.ordersDetailsProductsHeader,
                  ),
                ),
                SliverList.separated(
                  itemCount: order.items.length,
                  separatorBuilder: (_, __) => gapH8,
                  itemBuilder: (context, index) {
                    final item = order.items[index];
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
            sliverGapH14,
          ],
        ),
      ),
    );
  }
}
