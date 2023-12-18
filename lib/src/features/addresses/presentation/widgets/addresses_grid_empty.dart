import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';

class AddressesGridEmpty extends ConsumerWidget {
  const AddressesGridEmpty({
    super.key,
    required this.onRefresh,
  });

  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 365,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: surfaceContainer(ref),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SvgIcon(
            width: 45,
            iconName: 'information',
          ),
          gapH16,
          Text(context.l10n.addressesEmptyState),
          IconButton(
            onPressed: onRefresh,
            icon: const SvgIcon(iconName: 'reload'),
          )
        ],
      ),
    );
  }
}
