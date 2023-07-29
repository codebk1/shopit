import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/svg_icon.dart';

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
            backgroundColor: Theme.of(context).colorScheme.errorContainer,
            child: Row(
              children: [
                const SvgIcon(iconName: 'trash'),
                gapW2,
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
