import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/utils/utils.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/profile/profile.dart';
import 'package:shopit/src/features/addresses/addresses.dart';

class DefaultAddressMenuItem extends ConsumerStatefulWidget {
  const DefaultAddressMenuItem({
    super.key,
    required this.address,
    required this.controller,
  });

  final Address address;
  final MenuController controller;

  @override
  ConsumerState<DefaultAddressMenuItem> createState() =>
      _DefaultAddressMenuItemState();
}

class _DefaultAddressMenuItemState
    extends ConsumerState<DefaultAddressMenuItem> {
  Future<void>? _setAsDefault;

  void _submit() {
    setState(() {
      _setAsDefault = ref
          .read(profileControllerProvider.notifier)
          .setDefaultAddress(widget.address);
    });

    _setAsDefault!
        .whenComplete(() => widget.controller.close())
        .then(
          (_) => showSuccessSnackbar(
            context: context,
            content: context.l10n.addressesSetAsDefaultSuccessSnackbar,
          ),
        )
        .catchError(
          (error) => showErrorDialog(
            context: context,
            error: error,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _setAsDefault,
      builder: (context, snapshot) {
        final isLoading = snapshot.connectionState == ConnectionState.waiting;

        return MenuItemButton(
          closeOnActivate: false,
          onPressed: isLoading ? null : _submit,
          child: Row(
            children: [
              isLoading
                  ? const SizedBox(
                      width: 20,
                      child: Loader(dark: true),
                    )
                  : const SvgIcon(
                      width: 20,
                      iconName: 'addresses',
                    ),
              gapW4,
              Text(context.l10n.addressesSetAsDefaultMenuItem),
            ],
          ),
        );
      },
    );
  }
}
