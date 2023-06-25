import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  final _tabIcons = const [
    'assets/icons/home.svg',
    'assets/icons/categories.svg',
    'assets/icons/wishlist.svg',
    'assets/icons/account.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        // Here, the items of BottomNavigationBar are hard coded. In a real
        // world scenario, the items would most likely be generated from the
        // branches of the shell route, which can be fetched using
        // `navigationShell.route.branches`.
        onDestinationSelected: (int index) => _onTap(context, index),
        selectedIndex: navigationShell.currentIndex,
        //height: 50,
        destinations: _tabIcons
            .map(
              (icon) => NavigationDestination(
                icon: SvgPicture.asset(
                  icon,
                  colorFilter: ColorFilter.mode(
                    navigationShell.currentIndex == _tabIcons.indexOf(icon)
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).hintColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: '',
              ),
            )
            .toList(),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
