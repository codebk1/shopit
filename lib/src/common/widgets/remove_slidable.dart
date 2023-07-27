import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:shopit/src/l10n/l10n.dart';

class RemoveSlidable extends StatelessWidget {
  const RemoveSlidable({
    super.key,
    required this.onRemove,
    required this.child,
  });

  final VoidCallback onRemove;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(key),
      endActionPane: ActionPane(
        dismissible: DismissiblePane(
          onDismissed: onRemove,
        ),
        motion: const DrawerMotion(),
        children: [
          CustomSlidableAction(
            padding: const EdgeInsets.all(8),
            onPressed: (_) => onRemove(),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/trash.svg',
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
                Text(context.l10n.commonSlidableRemoveItemLabel),
              ],
            ),
          ),
        ],
      ),
      child: child,
    );
  }
}
