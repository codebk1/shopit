import 'package:flutter/material.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';

class AddressesGridError extends StatelessWidget {
  const AddressesGridError({
    super.key,
    required this.onRefresh,
  });

  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 365,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.l10n.addressesErrorState),
          IconButton(
            onPressed: onRefresh,
            icon: const SvgIcon(iconName: 'reload'),
          )
        ],
      ),
    );
  }
}
