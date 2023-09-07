import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/exceptions/exceptions.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/utils/utils.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/profile/profile.dart';
import 'package:shopit/src/features/addresses/addresses.dart';

class DefaultAddressBox extends ConsumerStatefulWidget {
  const DefaultAddressBox({
    super.key,
    required this.header,
    required this.type,
  });

  final String header;
  final AddressType type;

  @override
  ConsumerState<DefaultAddressBox> createState() => _DefaultAddressBoxState();
}

class _DefaultAddressBoxState extends ConsumerState<DefaultAddressBox> {
  void _changeAddress(Address address) {
    ref.read(addressesServiceProvider).setDefaultAddress(address).then(
      (_) {
        showSuccessSnackbar(
          context: context,
          content: context.l10n.addressesSetAsDefaultSuccessSnackbar,
        );
      },
    ).catchError(
      (error) {
        showErrorDialog(
          context: context,
          error: error,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.header,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        CustomPaint(
          size: const Size(100, 3),
          painter: Line(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: surfaceContainer(ref),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(14),
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
          ),
          child: Consumer(
            builder: (context, ref, child) {
              final address = ref.watch(defaultAddressProvider(widget.type));

              return address.when(
                data: (address) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    address != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                address.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(address.street),
                              Text('${address.postalCode}, ${address.city}'),
                            ],
                          )
                        : Text(context.l10n.profileNoDefaultAddress),
                    TextButton(
                      child: Text(
                        context.l10n.profileChangeDefaultAddressButton,
                      ),
                      onPressed: () async {
                        final selectedAddress = await showModalBottomSheet(
                          context: context,
                          showDragHandle: true,
                          builder: (_) => SelectDefaultAddressSheet(
                            currentAddress: address,
                            addressType: widget.type,
                          ),
                        );

                        if (selectedAddress != null) {
                          _changeAddress(selectedAddress);
                        }
                      },
                    )
                  ],
                ),
                error: (error, _) => Text(
                  errorMessage(error, context),
                ),
                loading: () => const ShimmerText(
                  width: 150,
                  oddLinesWidth: 100,
                  lines: 3,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
