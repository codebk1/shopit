import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:shopit/src/features/categories/categories_screen.dart';
import 'package:shopit/src/features/home/home_screen.dart';
import 'package:shopit/src/features/wishlist/wishlist_screen.dart';

import 'package:shopit/src/router/scaffold_with_navbar.dart';

import '../features/account/account_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _categoriesNavigatorKey = GlobalKey<NavigatorState>();
final _wishlistNavigatorKey = GlobalKey<NavigatorState>();
final _accountNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeScreen(),
              ),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _categoriesNavigatorKey,
          routes: [
            GoRoute(
              path: '/categories',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: CategoriesScreen(),
              ),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _wishlistNavigatorKey,
          routes: [
            GoRoute(
              path: '/wishlist',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: WishlistScreen(),
              ),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _accountNavigatorKey,
          routes: [
            GoRoute(
              path: '/account',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AccountScreen(),
              ),
              routes: [],
            ),
          ],
        ),
      ],
    ),
  ],
);
