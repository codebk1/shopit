import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class AddressActionButton extends ConsumerStatefulWidget {
  const AddressActionButton({
    super.key,
    this.select = false,
    required this.text,
    this.icon,
    required this.address,
  });

  final bool select;
  final String text;
  final String? icon;
  final Address address;

  @override
  ConsumerState<AddressActionButton> createState() =>
      _AddressActionButtonState();
}

class _AddressActionButtonState extends ConsumerState<AddressActionButton> {
  Future<void> _submit(Address address) async {
    var newAddress = address;
    final addressesService = ref.read(addressesServiceProvider);

    address.id == null
        ? newAddress = await addressesService.add(address)
        : await addressesService.set(address);

    return address.id == null
        ? ref.read(checkoutControllerProvider.notifier).setAddress(newAddress)
        : ref.invalidate(addressProvider(newAddress.id!, newAddress.type));
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Row(
        children: [
          Text(widget.text),
          if (widget.icon != null)
            SvgIcon(
              iconName: widget.icon!,
              color: Theme.of(context).colorScheme.primary,
            ),
        ],
      ),
      onPressed: () async {
        final selectedAddress = await showModalBottomSheet(
          context: context,
          showDragHandle: true,
          isScrollControlled: widget.select ? false : true,
          builder: (_) => widget.select
              ? SelectAddressSheet(
                  currentAddress: widget.address,
                )
              : AddressSheet(
                  address: widget.address,
                  submit: _submit,
                ),
        );

        if (selectedAddress != null) {
          ref
              .read(checkoutControllerProvider.notifier)
              .setAddress(selectedAddress);
        }
      },
    );
  }
}
