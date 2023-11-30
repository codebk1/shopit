import 'package:flutter/material.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/orders/orders.dart';

class OrderStatusChip extends StatelessWidget {
  const OrderStatusChip({
    super.key,
    required this.status,
  });

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final chip = switch (status) {
      OrderStatus.ordered => <String, dynamic>{
          'text': context.l10n.ordersListItemOrderedStatusLabel,
          'icon': 'document-check',
          'bg-color': const Color.fromARGB(255, 239, 246, 255),
          'text-color': const Color.fromARGB(255, 29, 78, 216),
        },
      OrderStatus.preparing => <String, dynamic>{
          'text': context.l10n.ordersListItemPreparingStatusLabel,
          'icon': 'box-open',
          'bg-color': const Color.fromARGB(255, 254, 252, 232),
          'text-color': const Color.fromARGB(255, 133, 77, 14)
        },
      OrderStatus.dispatched => <String, dynamic>{
          'text': context.l10n.ordersListItemDispatchedStatusLabel,
          'icon': 'truck-transit',
          'bg-color': const Color.fromARGB(255, 238, 242, 255),
          'text-color': const Color.fromARGB(255, 67, 56, 202)
        },
      OrderStatus.delivered => <String, dynamic>{
          'text': context.l10n.ordersListItemDeliveredStatusLabel,
          'icon': 'bag-check',
          'bg-color': const Color.fromARGB(255, 240, 253, 244),
          'text-color': const Color.fromARGB(255, 21, 128, 61)
        },
      OrderStatus.cancelled => <String, dynamic>{
          'text': context.l10n.ordersListItemCancelledStatusLabel,
          'icon': 'x-circle',
          'bg-color': const Color.fromARGB(255, 254, 242, 242),
          'text-color': const Color.fromARGB(255, 185, 28, 28)
        },
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: chip['bg-color'],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SvgIcon(
            iconName: chip['icon'],
            width: 20,
            color: chip['text-color'],
          ),
          gapW4,
          Text(
            chip['text'],
            style: TextStyle(
              color: chip['text-color'],
            ),
          ),
        ],
      ),
    );
  }
}
