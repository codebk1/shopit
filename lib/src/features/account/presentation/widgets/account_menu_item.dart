import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:shopit/src/common/widgets/svg_icon.dart';

class AccountMenuItem extends StatelessWidget {
  const AccountMenuItem({
    super.key,
    required this.title,
    required this.iconName,
    required this.route,
  });

  final String title;
  final String iconName;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgIcon(iconName: iconName),
      title: Text(title),
      trailing: const SvgIcon(iconName: 'chevron-right'),
      onTap: () => context.goNamed(route),
    );
  }
}
