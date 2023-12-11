import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/exceptions/exceptions.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/utils/utils.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/profile/profile.dart';
import 'package:shopit/src/features/orders/orders.dart';

class LatestOrder extends ConsumerWidget {
  const LatestOrder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final latestOrder = ref.watch(latestOrderProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              context.l10n.profileLatestOrderBoxHeader,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              latestOrder.valueOrNull?.formattedNumber ?? '',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        CustomPaint(
          size: const Size(100, 3),
          painter: Line(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: surfaceContainer(ref),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(14),
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
          ),
          child: latestOrder.when(
            data: (order) => order == null
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                    ),
                    child: Column(
                      children: [
                        const SvgIcon(
                          iconName: 'box-open',
                          height: 64,
                        ),
                        gapH8,
                        Text(context.l10n.profileNoLatestOrderText),
                        gapH4,
                        TextButton(
                          onPressed: () => context.goNamed(
                            Routes.categories.name,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                context
                                    .l10n.profileNoLatestOrderGoShoppingButton,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          const SvgIcon(
                            iconName: 'clock',
                          ),
                          gapW4,
                          Text(
                            'Delivery: ${DateFormat('MMMMEEEEd').format(
                              order.createdAt!.add(const Duration(days: 3)),
                            )}, 10am - 11am',
                          ),
                        ],
                      ),
                      gapH10,
                      Row(
                        children: [
                          const SvgIcon(
                            iconName: 'map-pin',
                          ),
                          gapW4,
                          Flexible(
                            child: Text(
                              '${order.deliveryAddress.street}, ${order.deliveryAddress.postalCode}, ${order.deliveryAddress.city}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      gapH14,
                      LatestOrderStatus(
                        activeIndex: order.status.index,
                      ),
                      gapH14,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.ordersListItemDeliveryLabel,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                    ),
                              ),
                              Text(
                                order.carrier.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.ordersListItemPaymentLabel,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                    ),
                              ),
                              Text(
                                order.payment.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.ordersListItemTotalLabel,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                    ),
                              ),
                              Text(
                                ref
                                    .read(currencyFormatterProvider)
                                    .format(order.total),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
            error: (error, _) => Text(
              errorMessage(error, context),
            ),
            loading: () => const LatestOrderLoader(),
          ),
        ),
      ],
    );
  }
}
