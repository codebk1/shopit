import 'package:flutter/material.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/addresses/addresses.dart';

class AddressData extends StatelessWidget {
  const AddressData({
    super.key,
    required this.address,
  });

  final Address address;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          address.name,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(address.street),
        Text('${address.postalCode}, ${address.city}'),
        gapH5,
        if (address.nip!.isNotEmpty)
          Row(
            children: [
              Text(context.l10n.addressesNIPLabel),
              gapW4,
              Expanded(
                child: Text(address.nip!),
              ),
            ],
          ),
        Row(
          children: [
            const SvgIcon(iconName: 'phone', width: 16),
            gapW4,
            Expanded(
              child: Text(address.phone),
            ),
          ],
        ),
        Row(
          children: [
            const SvgIcon(iconName: 'email', width: 16),
            gapW4,
            Expanded(
              child: Text(address.email),
            ),
          ],
        ),
      ],
    );
  }
}
