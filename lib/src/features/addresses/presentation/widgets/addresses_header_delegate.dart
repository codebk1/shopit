import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class AddressesHeaderDelegate extends SliverPersistentHeaderDelegate {
  const AddressesHeaderDelegate({
    required this.title,
    required this.type,
    required this.submit,
  });

  final String title;
  final AddressType type;
  final Future<void> Function(Address) submit;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Consumer(
            builder: (context, ref, child) {
              return IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    isScrollControlled: true,
                    builder: (_) => AddressSheet(
                      address: Address.empty(type),
                      submit: submit,
                    ),
                  );
                },
                icon: const SvgIcon(iconName: 'add'),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => minExtent;

  @override
  double get minExtent => 45;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
