import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/features/cart/application/controllers/cart_controller.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.title,
    this.showActions = true,
    this.actions = const [],
  });

  final String? title;
  final bool showActions;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      title: title == null
          ? SvgPicture.asset(
              'assets/logo.svg',
              height: 24,
            )
          : Text(title!),
      actions: showActions
          ? actions.isEmpty
              ? [
                  IconButton(
                    padding: const EdgeInsets.only(right: 14),
                    onPressed: () => context.pushNamed(Routes.cart.name),
                    icon: Badge(
                      offset: const Offset(6, -4),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      label: Consumer(
                        builder: (context, ref, child) {
                          final count = ref.watch(cartItemsCountProvider);
                          return Text(count.toString());
                        },
                      ),
                      child: SvgPicture.asset('assets/icons/cart.svg'),
                    ),
                  )
                ]
              : actions
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
