import 'dart:async';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopit/src/features/settings/presentation/pages/settings_page.dart';

import 'package:shopit/src/router/scaffold_with_navbar.dart';
import 'package:shopit/src/features/home/views/pages/home_page.dart';
import 'package:shopit/src/features/auth/data/repositories/auth_repository.dart';
import 'package:shopit/src/features/auth/presentation/pages/login_page.dart';
import 'package:shopit/src/features/auth/presentation/pages/signup_page.dart';
import 'package:shopit/src/features/account/presentation/pages/account_page.dart';
import 'package:shopit/src/features/account/presentation/pages/edit_account_page.dart';
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
        StatefulShellRoute.indexedStack(
          builder: (_, __, navigationShell) {
            return ScaffoldWithNavBar(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _homeNavigatorKey,
              routes: [
                GoRoute(
                  path: '/',
                  name: Routes.home.name,
                  pageBuilder: (_, state) => const NoTransitionPage(
                    child: HomePage(),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _categoriesNavigatorKey,
              routes: [
                GoRoute(
                  path: '/categories',
                  name: Routes.categories.name,
                  pageBuilder: (_, state) => const NoTransitionPage(
                    child: CategoriesPage(),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _wishlistNavigatorKey,
              routes: [
                GoRoute(
                  path: '/wishlist',
                  name: Routes.wishlist.name,
                  pageBuilder: (_, state) => const NoTransitionPage(
                    child: WishlistPage(),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _accountNavigatorKey,
              routes: [
                GoRoute(
                  path: '/account',
                  name: Routes.account.name,
                  pageBuilder: (_, state) => const NoTransitionPage(
                    child: AccountPage(),
                  ),
                  routes: [
                    GoRoute(
                      path: 'edit',
                      name: Routes.accountEdit.name,
                      pageBuilder: (_, state) => const NoTransitionPage(
                        child: EditAccountPage(),
                      ),
                    ),
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: 'settings',
                      name: Routes.accountSettings.name,
                      pageBuilder: (_, state) => const NoTransitionPage(
                        child: SettingsPage(),
                      ),
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
          pageBuilder: (_, state) => const NoTransitionPage(
            child: LoginPage(),
          ),
        ),
        GoRoute(
          path: '/signup',
          name: Routes.signup.name,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (_, state) => const NoTransitionPage(
            child: SignupPage(),
          ),
        ),
        GoRoute(
          path: '/cart',
          name: Routes.cart.name,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (_, state) => const NoTransitionPage(
            child: CartPage(),
          ),
        ),
        GoRoute(
          path: '/products',
          name: Routes.products.name,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (_, state) => NoTransitionPage(
            child: ProductsPage(
              category: state.extra as Category,
            ),
          ),
        ),
        GoRoute(
          path: '/product',
          name: Routes.product.name,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (_, state) => CustomTransitionPage(
            transitionsBuilder: (_, animation, __, child) => FadeTransition(
              opacity: animation,
              child: child,
            ),
            child: ProductPage(
              product: state.extra as Product,
            ),
          ),
        ),
      ],
    );
  },
);
