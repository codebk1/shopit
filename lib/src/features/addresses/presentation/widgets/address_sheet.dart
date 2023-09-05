import 'package:flutter/material.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/features/addresses/addresses.dart';

class AddressSheet extends StatelessWidget {
  const AddressSheet({
    super.key,
    required this.type,
    this.address,
  });

  final AddressType type;
  final Address? address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14, bottom: 14)
          .add(MediaQuery.of(context).viewInsets),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type == AddressType.delivery
                  ? context.l10n.addressesDeliveryAddressFormHeader
                  : context.l10n.addressesBillingAddressFormHeader,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            gapH14,
            AddressForm(
              type: type,
              address: address,
            ),
          ],
        ),
      ),
    );
  }
}
