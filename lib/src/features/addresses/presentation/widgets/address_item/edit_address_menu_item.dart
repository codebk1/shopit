import 'package:flutter/material.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/addresses/addresses.dart';

class EditAddressMenuItem extends StatelessWidget {
  const EditAddressMenuItem({
    super.key,
    required this.address,
    required this.submit,
  });

  final Address address;
  final Future<void> Function(Address) submit;

  @override
  Widget build(BuildContext context) {
    return MenuItemButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (_) => AddressSheet(
            address: address,
            submit: submit,
          ),
        );
      },
      child: Row(
        children: [
          const SvgIcon(
            iconName: 'edit',
            width: 20,
          ),
          gapW4,
          Text(context.l10n.addressesEditMenuItem),
        ],
      ),
    );
  }
}
