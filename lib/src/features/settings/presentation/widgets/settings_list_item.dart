import 'package:flutter/material.dart';

import 'package:shopit/src/common/widgets/svg_icon.dart';

class SettingsListItem extends StatelessWidget {
  const SettingsListItem({
    super.key,
    required this.title,
    this.extra,
    required this.iconName,
    required this.sheet,
  });

  final String title;
  final Widget? extra;
  final String iconName;
  final Widget sheet;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgIcon(iconName: iconName),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          if (extra != null) extra!,
        ],
      ),
      trailing: const SvgIcon(iconName: 'chevron-right'),
      onTap: () {
        showModalBottomSheet(
          context: context,
          showDragHandle: true,
          builder: (_) => sheet,
        );
      },
    );
  }
}
