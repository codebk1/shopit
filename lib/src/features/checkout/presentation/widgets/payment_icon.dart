import 'package:flutter/material.dart';

import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class PaymentIcon extends StatelessWidget {
  const PaymentIcon({
    super.key,
    required this.type,
  });

  final PaymentType type;

  @override
  Widget build(BuildContext context) {
    return SvgIcon(
      iconName: switch (type) {
        PaymentType.wireTransfer => 'wire-transfer',
        PaymentType.cod => 'cash',
        PaymentType.creditCard => 'credit-card',
        PaymentType.online => 'globe',
      },
      width: 35,
    );
  }
}
