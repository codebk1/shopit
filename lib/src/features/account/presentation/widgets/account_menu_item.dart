import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_svg/svg.dart';

class AccountMenuItem extends StatelessWidget {
  const AccountMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.route,
  });

  final String title;
  final String icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(icon),
      title: Text(title),
      trailing: SvgPicture.asset(
        'assets/icons/chevron-right.svg',
      ),
      onTap: () => context.goNamed(route),
    );
  }
}
