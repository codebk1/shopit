import 'dart:async';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopit/src/features/account/presentation/pages/edit_account_page.dart';
import 'package:shopit/src/features/auth/data/auth_repository.dart';
import 'package:shopit/src/features/home/views/pages/home_page.dart';
import 'package:shopit/src/features/products/domain/entities/product.dart';
import 'package:shopit/src/features/products/presentation/pages/product_page.dart';
import 'package:shopit/src/features/products/presentation/pages/products_page.dart';

import 'package:shopit/src/router/scaffold_with_navbar.dart';
import 'package:shopit/src/features/categories/presentation/pages/categories_page.dart';
import 'package:shopit/src/features/wishlist/presentation/pages/wishlist_page.dart';
import 'package:shopit/src/features/account/presentation/pages/account_page.dart';
import 'package:shopit/src/features/auth/presentation/pages/login_page.dart';
import 'package:shopit/src/features/auth/presentation/pages/signup_page.dart';
import 'package:shopit/src/features/categories/domain/category.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _categoriesNavigatorKey = GlobalKey<NavigatorState>();
final _wishlistNavigatorKey = GlobalKey<NavigatorState>();
final _accountNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: true,
    //refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    redirect: (context, state) {
      final isLogged = authRepository.currentUser != null;

      if (!isLogged && state.location.startsWith('/account')) {
        return '/login';
      }

      return null;
    },
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
                  child: HomePage(),
                ),
                redirect: (context, state) {
                  //GoRouter.of(context).push('/login');
                },
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
                  child: CategoriesPage(),
                ),
                routes: [
                  GoRoute(
                    path: 'products',
                    name: 'products',
                    parentNavigatorKey: _categoriesNavigatorKey,
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: ProductsPage(
                        category: state.extra as Category,
                      ),
                    ),
                    routes: [
                      GoRoute(
                        path: 'product',
                        name: 'product',
                        pageBuilder: (context, state) => CustomTransitionPage(
                          transitionDuration: const Duration(milliseconds: 200),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 200),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) =>
                                  FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                          child: ProductPage(
                            product: state.extra as Product,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _wishlistNavigatorKey,
            routes: [
              GoRoute(
                path: '/wishlist',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: WishlistPage(),
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
                  child: AccountPage(),
                ),
                routes: [
                  GoRoute(
                    path: 'edit',
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: EditAccountPage(),
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
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LoginPage(),
        ),
      ),
      GoRoute(
        path: '/signup',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SignupPage(),
        ),
      ),
    ],
  );
});

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
