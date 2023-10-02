import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/addresses/addresses.dart';

class AddressGridItem extends ConsumerStatefulWidget {
  const AddressGridItem({
    super.key,
    required this.address,
    this.isDefault = false,
  });

  final Address address;
  final bool isDefault;

  @override
  ConsumerState<AddressGridItem> createState() => _AddressGridItemState();
}

class _AddressGridItemState extends ConsumerState<AddressGridItem> {
  final _controller = MenuController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: surfaceContainer(ref),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: widget.isDefault
              ? Theme.of(context).colorScheme.primary
              : const Color.fromARGB(0, 0, 0, 0),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.isDefault
                    ? SvgIcon(
                        iconName: 'check-solid',
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : const SizedBox.shrink(),
                MenuAnchor(
                  controller: _controller,
                  builder: (_, controller, __) => IconButton(
                    icon: const SvgIcon(iconName: 'ellipsis-vertical'),
                    onPressed:
                        controller.isOpen ? controller.close : controller.open,
                  ),
                  menuChildren: [
                    if (!widget.isDefault)
                      DefaultAddressMenuItem(
                        address: widget.address,
                        controller: _controller,
                      ),
                    EditAddressMenuItem(
                      address: widget.address,
                    ),
                    DeleteAddressMenuItem(
                      address: widget.address,
                      controller: _controller,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.address.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(widget.address.street),
                  Text('${widget.address.postalCode}, ${widget.address.city}'),
                  gapH8,
                  if (widget.address.nip!.isNotEmpty)
                    Row(
                      children: [
                        const Text('NIP:'),
                        gapW4,
                        Text(widget.address.nip!),
                      ],
                    ),
                  Row(
                    children: [
                      const SvgIcon(iconName: 'phone', width: 16),
                      gapW4,
                      Text(widget.address.phone),
                    ],
                  ),
                  Row(
                    children: [
                      const SvgIcon(iconName: 'email', width: 16),
                      gapW4,
                      Text(widget.address.email),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}