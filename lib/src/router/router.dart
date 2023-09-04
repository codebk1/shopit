import 'dart:async';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/router/scaffold_with_navbar.dart';
import 'package:shopit/src/features/home/home.dart';
import 'package:shopit/src/features/auth/auth.dart';
import 'package:shopit/src/features/account/account.dart';
import 'package:shopit/src/features/profile/profile.dart';
import 'package:shopit/src/features/settings/settings.dart';
import 'package:shopit/src/features/wishlist/wishlist.dart';
import 'package:shopit/src/features/categories/categories.dart';
import 'package:shopit/src/features/products/products.dart';
import 'package:shopit/src/features/cart/cart.dart';

enum Routes {
  home,
  categories,
  wishlist,
  account,
  profile,
  settings,
  signin,
  signup,
  cart,
  products,
  product,
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _categoriesNavigatorKey = GlobalKey<NavigatorState>();
final _wishlistNavigatorKey = GlobalKey<NavigatorState>();
final _accountNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>(
  (ref) {
    final authRepository = ref.read(authRepositoryProvider);

    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/',
      redirect: (context, state) async {
        final isLogged = authRepository.currentUser != null;

        if (!isLogged && state.uri.toString().startsWith('/account')) {
          // solution until something will change - https://github.com/flutter/flutter/issues/114131
          await Future.delayed(const Duration(microseconds: 1));
          // ignore: use_build_context_synchronously
          await _rootNavigatorKey.currentContext!.pushNamed(Routes.signin.name);
        }

        return null;
      },
      routes: [
        StatefulShellRoute(
          builder: (_, __, navigationShell) => navigationShell,
          navigatorContainerBuilder: (_, navigationShell, children) {
            return ScaffoldWithNavBar(
              navigationShell: navigationShell,
              children: children,
            );
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _homeNavigatorKey,
              routes: [
                GoRoute(
                  path: '/',
                  name: Routes.home.name,
                  builder: (_, __) => const HomePage(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _categoriesNavigatorKey,
              routes: [
                GoRoute(
                  path: '/categories',
                  name: Routes.categories.name,
                  builder: (_, __) => const CategoriesPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _wishlistNavigatorKey,
              routes: [
                GoRoute(
                  path: '/wishlist',
                  name: Routes.wishlist.name,
                  builder: (_, __) => const WishlistPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _accountNavigatorKey,
              routes: [
                GoRoute(
                  path: '/account',
                  name: Routes.account.name,
                  builder: (_, __) => const AccountPage(),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: 'profile',
                      name: Routes.profile.name,
                      builder: (_, __) => const ProfilePage(),
                    ),
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: 'settings',
                      name: Routes.settings.name,
                      builder: (_, __) => const SettingsPage(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/signin',
          name: Routes.signin.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (_, __) => const SignInPage(),
        ),
        GoRoute(
          path: '/signup',
          name: Routes.signup.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (_, __) => const SignUpPage(),
        ),
        GoRoute(
          path: '/cart',
          name: Routes.cart.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (_, __) => const CartPage(),
        ),
        GoRoute(
          path: '/products',
          name: Routes.products.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (_, state) => ProductsPage(
            category: state.extra as Category,
          ),
        ),
        GoRoute(
          path: '/product',
          name: Routes.product.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (_, state) => ProductPage(
            product: state.extra as Product,
          ),
        ),
      ],
    );
  },
);
