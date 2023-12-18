import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class DeleteAddressMenuItem extends ConsumerStatefulWidget {
  const DeleteAddressMenuItem({
    super.key,
    required this.address,
    required this.controller,
  });

  final Address address;
  final MenuController controller;

  @override
  ConsumerState<DeleteAddressMenuItem> createState() =>
      _DeleteAddressMenuItemState();
}

class _DeleteAddressMenuItemState extends ConsumerState<DeleteAddressMenuItem> {
  Future<void>? _delete;

  void _submit() {
    setState(() {
      _delete = ref
          .read(addressesControllerProvider(widget.address.type).notifier)
          .delete(widget.address);
    });

    _delete!
        .whenComplete(() => widget.controller.close())
        .then(
          (_) => showSuccessSnackbar(
            context: context,
            content: context.l10n.addressesDeleteSuccessSnackbar,
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
      future: _delete,
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
                  : SvgIcon(
                      iconName: 'trash',
                      width: 20,
                      color: Theme.of(context).colorScheme.error,
                    ),
              gapW4,
              Text(
                context.l10n.addressesDeleteMenuItem,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ],
          ),
        );
      },
    );
  }
}
