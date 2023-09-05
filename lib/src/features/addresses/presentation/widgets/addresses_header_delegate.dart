import 'package:flutter/material.dart';

import 'package:shopit/src/common/common.dart';

class AddressesHeaderDelegate extends SliverPersistentHeaderDelegate {
  const AddressesHeaderDelegate({
    required this.title,
    required this.sheet,
  });

  final String title;
  final Widget sheet;

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
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                isScrollControlled: true,
                builder: (_) => sheet,
              );
            },
            icon: const SvgIcon(iconName: 'add'),
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
