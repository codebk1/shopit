import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class OrdersPage extends ConsumerWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupedOrders = ref.watch(groupedOrdersProvider);

    return Scaffold(
      appBar: MainAppBar(
        title: context.l10n.ordersAppBarTitle,
        showActions: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 14,
          right: 14,
          top: 14,
        ),
        child: groupedOrders.when(
          data: (groups) => groups.isEmpty
              ? EmptyState(
                  text: context.l10n.ordersEmptyStateText,
                  onRefresh: () => ref.invalidate(ordersProvider),
                )
              : CustomScrollView(
                  slivers: [
                    for (var group in groups.entries)
                      SliverMainAxisGroup(
                        slivers: [
                          SliverPersistentHeader(
                            pinned: true,
                            delegate: TextHeaderDelegate(
                              text: DateFormat(
                                'LLLL yyyy',
                                context.l10n.localeName,
                              ).format(group.key),
                            ),
                          ),
                          SliverList.separated(
                            itemCount: group.value.length,
                            separatorBuilder: (_, __) => gapH8,
                            itemBuilder: (context, index) {
                              final order = group.value[index];
                              return GestureDetector(
                                onTap: () => context.pushNamed(
                                  Routes.order.name,
                                  extra: order,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .surfaceContainer,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            order.formattedNumber,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          OrderStatusChip(
                                            status: order.status,
                                          ),
                                        ],
                                      ),
                                      gapH14,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                context.l10n
                                                    .ordersListItemDeliveryLabel,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .outline,
                                                    ),
                                              ),
                                              Text(
                                                order.carrier.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                context.l10n
                                                    .ordersListItemPaymentLabel,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .outline,
                                                    ),
                                              ),
                                              Text(
                                                order.payment.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                context.l10n
                                                    .ordersListItemTotalLabel,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .outline,
                                                    ),
                                              ),
                                              Text(
                                                ref
                                                    .read(
                                                        currencyFormatterProvider)
                                                    .format(order.total),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          sliverGapH14,
                        ],
                      ),
                  ],
                ),
          error: (error, _) => Text(
            errorMessage(error, context),
          ),
          loading: () => const OrdersListLoader(),
        ),
      ),
    );
  }
}
