import 'package:flutter/material.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

class AddressSheet extends StatelessWidget {
  const AddressSheet({
    super.key,
    required this.address,
    required this.submit,
  });

  final Address address;
  final Future<void> Function(Address) submit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
        bottom: 14,
      ).add(MediaQuery.viewInsetsOf(context)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              address.type == AddressType.delivery
                  ? context.l10n.addressesDeliveryAddressFormHeader
                  : context.l10n.addressesPaymentAddressFormHeader,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            gapH14,
            AddressForm(
              address: address,
              submit: submit,
            ),
          ],
        ),
      ),
    );
  }
}
