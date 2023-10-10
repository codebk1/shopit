import 'package:flutter/material.dart';

import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/carriers/carriers.dart';

class CarrierIcon extends StatelessWidget {
  const CarrierIcon({
    super.key,
    required this.type,
  });

  final CarrierType type;

  @override
  Widget build(BuildContext context) {
    return SvgIcon(
      iconName: switch (type) {
        CarrierType.selfPickup => 'home',
        CarrierType.courier => 'truck-transit',
        CarrierType.parcelLocker => 'parcel-locker',
      },
      width: 35,
    );
  }
}
