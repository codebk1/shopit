import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/common/widgets/svg_icon.dart';
import 'package:shopit/src/features/wishlist/application/controllers/wishlist_controller.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  final _tabIcons = const [
    'home',
    'categories',
    'heart',
    'account',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          topLeft: Radius.circular(8),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) => _onTap(context, index),
          selectedIndex: navigationShell.currentIndex,
          destinations: _tabIcons.map((icon) {
            final iconIndex = _tabIcons.indexOf(icon);
            final navIcon = SvgIcon(
              iconName: icon,
              color: navigationShell.currentIndex == iconIndex
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
            );

            return NavigationDestination(
              icon: iconIndex == 2
                  ? Badge(
                      offset: const Offset(8, -8),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      label: Consumer(
                        builder: (_, ref, __) {
                          final wishlistCount = ref.watch(
                            wishlistItemsCountProvider,
                          );

                          return Text(wishlistCount.toString());
                        },
                      ),
                      child: navIcon,
                    )
                  : navIcon,
              label: '',
            );
          }).toList(),
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: true,
    );
  }
}
