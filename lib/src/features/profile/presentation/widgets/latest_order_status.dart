import 'package:flutter/material.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';

class LatestOrderStatus extends StatelessWidget {
  const LatestOrderStatus({
    super.key,
    required this.activeIndex,
  });

  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    final statusItemLabels = [
      [
        _LatestStatus(
          label: context.l10n.ordersListItemOrderedStatusLabel,
          icon: 'document-check',
        ),
      ],
      [
        _LatestStatus(
          label: context.l10n.ordersListItemPreparingStatusLabel,
          icon: 'box-open',
        ),
      ],
      [
        _LatestStatus(
          label: context.l10n.ordersListItemDispatchedStatusLabel,
          icon: 'truck-transit',
        ),
      ],
      [
        _LatestStatus(
          label: context.l10n.ordersListItemDeliveredStatusLabel,
          icon: 'bag-check',
        ),
        _LatestStatus(
          label: context.l10n.ordersListItemCancelledStatusLabel,
          icon: 'x-circle',
        ),
      ]
    ];

    final items = statusItemLabels.indexed.map(
      (e) {
        final index = e.$2.length > 1
            ? e.$1 + e.$2.length - 1 <= activeIndex
                ? activeIndex - e.$1
                : 0
            : 0;

        return Column(
          children: [
            Text(
              e.$2[index].label,
              style: activeIndex == e.$1 + index
                  ? Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      )
                  : Theme.of(context).textTheme.bodySmall,
            ),
            activeIndex <= e.$1 + e.$2.length - 1
                ? SvgIcon(
                    iconName: e.$2[index].icon,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : const SvgIcon(
                    iconName: 'check-solid',
                    color: Color.fromARGB(255, 67, 160, 71),
                  ),
          ],
        );
      },
    );

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: items.indexed
            .expand(
              (e) => [
                e.$2,
                if (e.$1 != items.length - 1) ...[
                  gapW8,
                  const Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                ],
              ],
            )
            .toList(),
      ),
    );
  }
}

class _LatestStatus {
  const _LatestStatus({
    required this.label,
    required this.icon,
  });

  final String label;
  final String icon;
}
