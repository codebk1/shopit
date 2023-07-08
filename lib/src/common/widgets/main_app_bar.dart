import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.title = 'Shopit',
    this.showActions = true,
    this.actions = const [],
  });

  final String title;
  final bool showActions;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      title: Text(title),
      actions: showActions
          ? actions.isEmpty
              ? [
                  IconButton(
                    onPressed: () => context.push('/cart'),
                    icon: SvgPicture.asset('assets/icons/cart.svg'),
                  )
                ]
              : actions
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
