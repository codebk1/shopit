import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/wishlist/wishlist.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    required this.children,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  final _tabIcons = const [
    'home',
    'categories',
    'heart',
    'account',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBranch(
        currentIndex: navigationShell.currentIndex,
        children: children,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(14),
          topLeft: Radius.circular(14),
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

class AnimatedBranch extends StatefulWidget {
  const AnimatedBranch({
    super.key,
    required this.currentIndex,
    required this.children,
  });

  final int currentIndex;
  final List<Widget> children;

  @override
  State<AnimatedBranch> createState() => _AnimatedBranchState();
}

class _AnimatedBranchState extends State<AnimatedBranch>
    with TickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: widget.children.length,
    vsync: this,
  );

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController.index = widget.currentIndex;

    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: widget.children,
    );
  }
}
