import 'dart:async';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/router/scaffold_with_navbar.dart';
import 'package:shopit/src/features/home/views/pages/home_page.dart';
import 'package:shopit/src/features/auth/data/repositories/auth_repository.dart';
import 'package:shopit/src/features/auth/presentation/pages/login_page.dart';
import 'package:shopit/src/features/auth/presentation/pages/signup_page.dart';
import 'package:shopit/src/features/account/presentation/pages/account_page.dart';
import 'package:shopit/src/features/account/presentation/pages/edit_account_page.dart';
import 'package:shopit/src/features/settings/presentation/pages/settings_page.dart';
import 'package:shopit/src/features/wishlist/presentation/pages/wishlist_page.dart';
import 'package:shopit/src/features/categories/domain/entities/category.dart';
import 'package:shopit/src/features/categories/presentation/pages/categories_page.dart';
import 'package:shopit/src/features/products/domain/entities/product.dart';
import 'package:shopit/src/features/products/presentation/pages/products_page.dart';
import 'package:shopit/src/features/products/presentation/pages/product_page.dart';
import 'package:shopit/src/features/cart/presentation/pages/cart_page.dart';

enum Routes {
  home,
  categories,
  wishlist,
  account,
  accountEdit,
  accountSettings,
  login,
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
    final authRepository = ref.watch(authRepositoryProvider);

    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/',
      redirect: (context, state) async {
        final isLogged = authRepository.currentUser != null;

        if (!isLogged && state.location.startsWith('/account')) {
          // solution until something will change - https://github.com/flutter/flutter/issues/114131
          await Future.delayed(const Duration(microseconds: 1));
          // ignore: use_build_context_synchronously
          await _rootNavigatorKey.currentContext!.pushNamed(Routes.login.name);
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
                      path: 'edit',
                      name: Routes.accountEdit.name,
                      builder: (_, __) => const EditAccountPage(),
                    ),
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: 'settings',
                      name: Routes.accountSettings.name,
                      builder: (_, __) => const SettingsPage(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/login',
          name: Routes.login.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (_, __) => const LoginPage(),
        ),
        GoRoute(
          path: '/signup',
          name: Routes.signup.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (_, __) => const SignupPage(),
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
